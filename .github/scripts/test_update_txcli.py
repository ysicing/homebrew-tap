import io
import pathlib
import tempfile
import unittest
from unittest.mock import patch

import update_txcli as updater


class UpdateTxcliTests(unittest.TestCase):
    def checksums(self, version="1.0.1"):
        return "\n".join(
            f"{'a' * 64}  ./txcli_v{version}_{platform}.tar.gz"
            for platform in updater.PLATFORMS
        )

    def test_latest_tag_uses_numeric_order_and_ignores_prereleases(self):
        refs = "\n".join(
            f"abc\trefs/tags/{tag}"
            for tag in ("v1.9.0", "v1.10.0", "v1.10.0^{}", "v2.0.0-rc.1")
        )
        self.assertEqual(updater.latest_version(refs), "1.10.0")
        with self.assertRaises(ValueError):
            updater.latest_version("abc\trefs/tags/v2.0.0-rc.1")

    def test_missing_duplicate_or_invalid_checksums_are_rejected(self):
        good = self.checksums()
        for content in (
            "\n".join(good.splitlines()[:-1]),
            good + "\n" + good.splitlines()[0],
            good.replace("a" * 64, "invalid", 1),
        ):
            with self.subTest(content=content), self.assertRaises(ValueError):
                updater.release_checksums(content, "1.0.1")

    def test_same_or_older_version_does_not_fetch_or_write(self):
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / "txcli.rb"
            original = 'class Txcli < Formula\n  version "1.0.1"\nend\n'
            path.write_text(original)
            with patch.object(updater.urllib.request, "urlopen") as fetch:
                self.assertFalse(updater.update_formula(path, "1.0.1"))
                self.assertFalse(updater.update_formula(path, "1.0.0"))
                fetch.assert_not_called()
            self.assertEqual(path.read_text(), original)

    def test_failed_verification_preserves_existing_formula(self):
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / "txcli.rb"
            original = 'class Txcli < Formula\n  version "1.0.0"\nend\n'
            path.write_text(original)
            for failure in (ValueError("download failed"), "b" * 64):
                with self.subTest(failure=failure):
                    with patch.object(
                        updater.urllib.request, "urlopen",
                        return_value=io.BytesIO(self.checksums().encode()),
                    ), patch.object(updater, "download_hash") as download:
                        if isinstance(failure, Exception):
                            download.side_effect = failure
                        else:
                            download.return_value = failure
                        with self.assertRaises(ValueError):
                            updater.update_formula(path, "1.0.1")
                self.assertEqual(path.read_text(), original)

    def test_success_verifies_all_platforms_before_writing(self):
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / "Formula/txcli.rb"
            with patch.object(
                updater.urllib.request, "urlopen",
                return_value=io.BytesIO(self.checksums().encode()),
            ), patch.object(updater, "download_hash", return_value="a" * 64) as download:
                self.assertTrue(updater.update_formula(path, "1.0.1"))
            self.assertEqual(download.call_count, 4)
            formula = path.read_text()
            self.assertIn('version "1.0.1"', formula)
            for platform in updater.PLATFORMS:
                self.assertIn(f"_{platform}.tar.gz", formula)


if __name__ == "__main__":
    unittest.main()

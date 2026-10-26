#!/usr/bin/env python3
"""Update the txcli formula from a verified public CNB release."""

import hashlib
import pathlib
import re
import subprocess
import urllib.request

REPOSITORY = "https://cnb.cool/ysicing/txcli"
DOWNLOADS = f"{REPOSITORY}/-/releases/download"
FORMULA = pathlib.Path(__file__).resolve().parents[2] / "Formula/txcli.rb"
PLATFORMS = ("darwin_arm64", "darwin_amd64", "linux_arm64", "linux_amd64")


def version_tuple(version):
    if not re.fullmatch(r"(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)", version):
        raise ValueError(f"Invalid stable version: {version}")
    return tuple(map(int, version.split(".")))


def latest_version(refs):
    versions = []
    for line in refs.splitlines():
        match = re.search(r"\trefs/tags/v(\d+\.\d+\.\d+)$", line)
        if match:
            version = match[1]
            versions.append((version_tuple(version), version))
    if not versions:
        raise ValueError("No stable txcli tag found")
    return max(versions)[1]


def release_checksums(content, version):
    checksums = {}
    for line in content.splitlines():
        match = re.fullmatch(r"([0-9a-f]{64})\s+\*?(?:\./)?([A-Za-z0-9_.-]+)", line)
        if not match or match[2] in checksums:
            raise ValueError("Invalid or duplicate SHA256SUMS entry")
        checksums[match[2]] = match[1]
    required = {f"txcli_v{version}_{platform}.tar.gz" for platform in PLATFORMS}
    if not required <= checksums.keys():
        raise ValueError("Release is missing a supported platform checksum")
    return {platform: checksums[f"txcli_v{version}_{platform}.tar.gz"] for platform in PLATFORMS}


def render_formula(version, checksums):
    version_tuple(version)
    lines = [
        "class Txcli < Formula",
        '  desc "Tencent Cloud CLI for Lighthouse, DNSPod, EdgeOne and storage"',
        f'  homepage "{REPOSITORY}"',
        f'  version "{version}"',
        "",
    ]
    for os_name, system in (("macos", "darwin"), ("linux", "linux")):
        lines.append(f"  on_{os_name} do")
        for index, (cpu, arch) in enumerate((("arm", "arm64"), ("intel", "amd64"))):
            if index:
                lines.append("")
            lines.extend([
                f"    on_{cpu} do",
                f'      url "{DOWNLOADS}/v#{{version}}/txcli_v#{{version}}_{system}_{arch}.tar.gz"',
                f'      sha256 "{checksums[f"{system}_{arch}"]}"',
                "    end",
            ])
        lines.extend(["  end", ""])
    lines.extend([
        "  def install",
        '    bin.install "txcli"',
        "  end",
        "",
        "  test do",
        '    assert_match "Lighthouse", shell_output("#{bin}/txcli --help")',
        '    policy = JSON.parse(shell_output("#{bin}/txcli policygen --read-only"))',
        '    assert_equal "2.0", policy.fetch("version")',
        "  end",
        "end",
        "",
    ])
    return "\n".join(lines)


def download_hash(url):
    digest = hashlib.sha256()
    with urllib.request.urlopen(url, timeout=60) as response:
        for chunk in iter(lambda: response.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def update_formula(path, version):
    version_tuple(version)
    if path.exists():
        match = re.search(r'^  version "([^"]+)"$', path.read_text(), re.MULTILINE)
        if not match:
            raise ValueError("Cannot determine current formula version")
        if version_tuple(version) <= version_tuple(match[1]):
            print(f"txcli {match[1]} is already current; no update")
            return False
    base = f"{DOWNLOADS}/v{version}"
    with urllib.request.urlopen(f"{base}/SHA256SUMS", timeout=60) as response:
        content = response.read(65537)
    if len(content) > 65536:
        raise ValueError("SHA256SUMS is unexpectedly large")
    checksums = release_checksums(content.decode("ascii"), version)
    # Only replace the formula after every supported binary is publicly available
    # and matches its checksum. A partially uploaded release must not be published.
    for platform, expected in checksums.items():
        url = f"{base}/txcli_v{version}_{platform}.tar.gz"
        if download_hash(url) != expected:
            raise ValueError(f"Checksum mismatch for {platform}")
        print(f"Verified {platform}", flush=True)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(render_formula(version, checksums))
    print(f"Updated txcli to {version}")
    return True


if __name__ == "__main__":
    refs = subprocess.check_output(
        ["git", "-c", "credential.helper=", "ls-remote", f"{REPOSITORY}.git", "refs/tags/v*"],
        text=True,
        timeout=60,
    )
    update_formula(FORMULA, latest_version(refs))

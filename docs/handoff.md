# Maintenance notes

- txcli uses public CNB Git tags and release download URLs. The CNB Release API requires authentication even for this public repository; the updater must not depend on an unstated CNB token.
- Only stable `vX.Y.Z` tags are eligible. Ignore annotated tag dereferences and prerelease tags, compare versions numerically, and preserve the formula when the candidate is not newer.
- A pushed tag can precede its release attachments. Verify SHA256SUMS and all four supported binary downloads before replacing the formula; a failed or incomplete release leaves the existing formula intact. The hourly workflow retries on its next run and uses the tap's own GitHub Actions token.

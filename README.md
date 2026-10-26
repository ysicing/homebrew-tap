## ysicing Homebrew Tap

Install XStats:

```
brew tap ysicing/tap
brew trust ysicing/tap
brew install --cask xstats
```

For the standalone screenshot and recording app, install `xstats-capture` instead:

```sh
brew install --cask ysicing/tap/xstats-capture
```

XStats and Capture track independent stable releases. Both apps support in-app updates;
use `brew upgrade --cask --greedy` to include them in Homebrew upgrades.
Uninstall requests a normal quit and removes the selected app. Add `--zap` to remove
its listed private settings and data. The shared `~/Library/Caches/XStatsCapture`
media cache and the separate XStats Network Monitor component are retained.

### txcli

Install the Tencent Cloud command-line tool on macOS or Linux:

```sh
brew install ysicing/tap/txcli
txcli --help
```

The formula uses the official CNB release binaries for Apple Silicon/ARM64 and
Intel/AMD64. The `Update txcli` workflow checks stable releases hourly and also
supports manual runs. It verifies all four binaries before updating the formula,
skips prereleases, and never downgrades the formula version.

#### Available packages

Package | Type | Description
--- | --- | ---
[xstats](https://github.com/ysicing/xstats) | Cask | macOS menu bar system monitor
[xstats-capture](https://github.com/ysicing/XStats) | Cask | Standalone screenshot annotation and screen recording
[txcli](https://cnb.cool/ysicing/txcli) | Formula | Tencent Cloud CLI for Lighthouse, DNSPod, EdgeOne and storage

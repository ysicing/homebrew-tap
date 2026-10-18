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

#### Available packages

Package | Type | Description
--- | --- | ---
[xstats](https://github.com/ysicing/xstats) | Cask | macOS menu bar system monitor
[xstats-capture](https://github.com/ysicing/XStats) | Cask | Standalone screenshot annotation and screen recording

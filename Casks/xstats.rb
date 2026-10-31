cask "xstats" do
  version "1.5.0"
  sha256 "5cc0039e7ab19bffbcb54e41a6f75a492677d4be9784387da55ac9924f4de46a"

  url "https://c.ysicing.net/oss/apps/macOS/XStats/XStats-#{version}-AppleSilicon.dmg"
  name "XStats"
  desc "Menu bar system monitor with fan control, keep-awake and cleanup"
  homepage "https://github.com/ysicing/xstats"

  livecheck do
    url :homepage
    regex(/^v(\d+\.\d+\.\d+)$/i)
    strategy :github_releases
  end

  # 应用内置在线升级，brew upgrade 默认不再重复升级
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "XStats.app"

  uninstall quit: "work.12306.xstats.app"

  # XStatsCapture 素材缓存由两个产品共用，卸载任一产品时保留。
  zap trash: [
    "~/Library/Application Support/XStats",
    "~/Library/Caches/work.12306.xstats.app",
    "~/Library/Caches/XStats",
    "~/Library/Logs/XStats",
    "~/Library/Preferences/work.12306.xstats.app.plist",
  ]
end

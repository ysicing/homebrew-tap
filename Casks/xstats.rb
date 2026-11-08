cask "xstats" do
  version "1.6.1"
  sha256 "f93098862a01f40f242b51ee412cc3de75563ca4f4c02308d1003692b2e7297b"

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

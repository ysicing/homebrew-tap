cask "xstats" do
  version "1.4.11"
  sha256 "8cc7d6c618e9e3ae462a8dc6165f6fdb86c1a9177bece6d49bbf7b4bd74c6c5a"
  url "https://c.ysicing.net/oss/apps/macOS/XStats/XStats-#{version}-AppleSilicon.dmg"
  name "XStats"
  desc "Menu bar system monitor with fan control, keep-awake and cleanup"
  homepage "https://github.com/ysicing/xstats"
  livecheck do
    url :homepage
    regex(/^v(\d+\.\d+\.\d+)$/i)
    strategy :github_releases
  end
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma
  app "XStats.app"
  uninstall quit: "work.12306.xstats.app"
  zap trash: [
    "~/Library/Application Support/XStats",
    "~/Library/Caches/work.12306.xstats.app",
    "~/Library/Caches/XStats",
    "~/Library/Logs/XStats",
    "~/Library/Preferences/work.12306.xstats.app.plist",
  ]
end

cask "xstats" do
  version "0.10.0"
  sha256 "379a17fae206e02866bac25bc2ac759f5f8b69e91686174245af463fd51bb04c"

  url "https://c.ysicing.net/oss/apps/macOS/XStats/XStats-#{version}-AppleSilicon.dmg"
  name "XStats"
  desc "Menu bar system monitor with fan control, keep-awake and cleanup"
  homepage "https://github.com/ysicing/xstats"

  # 应用内置在线升级，brew upgrade 默认不再重复升级
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "XStats.app"

  zap trash: [
    "~/Library/Logs/XStats",
    "~/Library/Preferences/work.12306.xstats.app.plist",
  ]
end

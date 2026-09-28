cask "xstats" do
  version "0.13.0"
  sha256 "b90527ad19ad188fa87abd756d09d311498b6c7366bfd41c32b23052454492e7"

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

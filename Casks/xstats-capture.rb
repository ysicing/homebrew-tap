cask "xstats-capture" do
  version "0.1.0"
  sha256 "3848a6ab7e8e080dd34bd802c844e4de9260e32d266f8b02338c8b53822792d4"

  url "https://c.ysicing.net/oss/apps/macOS/XStats/capture/XStats-Capture-#{version}-AppleSilicon.dmg"
  name "XStats Capture"
  desc "Screenshot annotation, local redaction and screen recording"
  homepage "https://github.com/ysicing/XStats"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma
  app "XStats Capture.app"
  zap trash: "~/Library/Preferences/work.12306.xstats.capture.plist"
end

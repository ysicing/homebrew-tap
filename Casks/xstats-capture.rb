cask "xstats-capture" do
  version "0.1.1"
  sha256 "d91bb702d18e91273413ac801b4d27c4596bd0cac333d0dcda1fc8f637278bc1"

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

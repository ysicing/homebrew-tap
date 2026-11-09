cask "xstats-capture" do
  version "0.1.12"
  sha256 "506b6ed3f18794a61425eaa1954b25ef9a93ffd54152d24c91dfa6e90eb86da0"

  url "https://c.ysicing.net/oss/apps/macOS/XStats/capture/XStats-Capture-#{version}-AppleSilicon.dmg"
  name "XStats Capture"
  desc "Screenshot annotation, local redaction and screen recording"
  homepage "https://github.com/ysicing/XStats"

  livecheck do
    url :homepage
    regex(/^capture-v(\d+\.\d+\.\d+)$/i)
    strategy :github_releases
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "XStats Capture.app"

  uninstall quit: "work.12306.xstats.capture"

  # XStatsCapture 素材缓存由两个产品共用，卸载任一产品时保留。
  zap trash: [
    "~/Library/Caches/work.12306.xstats.capture",
    "~/Library/Preferences/work.12306.xstats.capture.plist",
  ]
end

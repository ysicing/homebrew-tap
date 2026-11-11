cask "xsourcetree" do
  arch arm: "arm64", intel: "amd64"

  version "0.0.5"
  sha256 arm:   "5c1874f38c582c026ce0a88505e3e872d541a3a5b71740332a2741bcc0330ad3",
         intel: "1fdfa397fff2cff5ae5ddc75c6bf70479b29df4a87cf348c59130843121f5fbe"

  url "https://c.ysicing.net/oss/apps/macOS/XSourceTree/xsourcetree-#{version}-#{arch}.dmg"
  name "XSourceTree"
  desc "Lightweight native Git client"
  homepage "https://github.com/ysicing/homebrew-tap#xsourcetree"

  livecheck do
    url "https://c.ysicing.net/oss/apps/macOS/XSourceTree/update-darwin-arm64.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "XSourceTree.app"

  uninstall quit: "com.ysicing.xsourcetree"
end

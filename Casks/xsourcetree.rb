cask "xsourcetree" do
  arch arm: "arm64", intel: "amd64"

  version "0.0.3"
  sha256 arm:   "9102e3ca7ae03cef02a3b396f6302aa7aef2e52931f283e5dc8c8329f420874d",
         intel: "8870e32ce54ce47fb976a50f48f2efd93037bf24f98618aaf07bc39a19004dec"

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

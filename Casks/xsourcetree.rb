cask "xsourcetree" do
  arch arm: "arm64", intel: "amd64"

  version "0.0.7"
  sha256 arm:   "2c9184624ab7ac74db49e778145d9225f4168b282897522d6a1339bac57d72c7",
         intel: "26383742ceeade4712f50cfc53ea2fa32c28e5afbdc6cc84a8e9814fff16666b"

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

cask "xsourcetree" do
  arch arm: "arm64", intel: "amd64"

  version "0.0.9"
  sha256 arm:   "39c9f07556b0b106653cfccd98511d1612772421cbfe059e3babca105a3e2f25",
         intel: "d6e07a649abf8c793cebcfc222d95daec2eddae696c8a92f2ecec20149996f4f"

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

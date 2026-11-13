cask "xsourcetree" do
  arch arm: "arm64", intel: "amd64"

  version "0.0.11"
  sha256 arm:   "624d4e58f58bee2099b55f35d0a2f2ebf8240078899e46afdafab4ee8ce4f0e7",
         intel: "997fd12c18c14e71125212c9a664f938e6c53c1c11160586ee7ab133f508ddcd"

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

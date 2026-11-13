cask "xsourcetree" do
  arch arm: "arm64", intel: "amd64"

  version "0.0.10"
  sha256 arm:   "0203910829dced5196518ed3ed6952e595c222b85d2beef33806e8a12dda78b0",
         intel: "eaa1e8d8442aa5cf4191fe791ebb24437ba587f4e63ce3720b9a8f74a52d6f41"

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

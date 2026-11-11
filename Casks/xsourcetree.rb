cask "xsourcetree" do
  arch arm: "arm64", intel: "amd64"

  version "0.0.6"
  sha256 arm:   "1187549cd4f47f1a3086b7c5870f836104c646f22fcfc4b2593a69e91c1e1de2",
         intel: "d7a8bc0dd7c224857c628d68089ba7d08e52e301e93924079f8648bb6243005b"

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

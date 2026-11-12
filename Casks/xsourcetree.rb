cask "xsourcetree" do
  arch arm: "arm64", intel: "amd64"

  version "0.0.8"
  sha256 arm:   "ba8fcc1b6e06bc0c2d980d77ecf16f76a28523a3a4c4d15094ab0746513f7340",
         intel: "60ce702498cd52ecf0b41d7b43c119b1899ee22f4e1f4bff74904c2c8dcddfbe"

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

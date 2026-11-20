cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.4"
  sha256 arm:   "24611262b797438f61768d05f86e55c8f09b3e05e7d5f742732ece6361372a03",
         intel: "3d9a3ea9d0a59b22e8d8ca51c7ee3738001cc94ac97a2cce1c4f157e6d71fddf"

  url "https://c.ysicing.net/oss/apps/macOS/51code/51code-#{version}-#{arch}.dmg"
  name "51Code"
  desc "Lightweight native Git client"
  homepage "https://github.com/ysicing/51code"

  livecheck do
    url "https://c.ysicing.net/oss/apps/macOS/51code/update-darwin-arm64.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "51Code.app"

  uninstall quit: "com.ysicing.xsourcetree"
end

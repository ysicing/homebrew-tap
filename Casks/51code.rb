cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.0"
  sha256 arm:   "ebd6e8d5c529a032f10fe1c705ce5780cb369c4ecb59510dfe61df56b27770c8",
         intel: "edd2099bf9779678d2d1a92aa02ba675f684ccfc3b2db492754f4fd304a0cb37"

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

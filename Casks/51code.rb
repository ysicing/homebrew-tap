cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.3"
  sha256 arm:   "fcecfa7f52965348593b8777e7ed51ca8cb126c3bbaa790780fc4c38cca26afa",
         intel: "bde3eb5ba442422a8493dd34cc2612a2daa21816e1feaeeb61b390f859292671"

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

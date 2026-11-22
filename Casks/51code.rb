cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.0"
  sha256 arm:   "b82c72d823587325a3292330b92d6abccf5bb57227e9f8fd5060779e9bb95edb",
         intel: "1bffe1aad05ae32d02b3c22087a5cd8db7668fca3f102c958aa00d378f6f2594"

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

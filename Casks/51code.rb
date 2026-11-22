cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.1"
  sha256 arm:   "f3057e95bc490c232462285dbbf70c7a1e1593b6afe9cb7e840c54c9186a16f0",
         intel: "214dac19a3ccdb397f74bedfdcd06e18aca7a7fecf9733cdbbdd03f9956e1c05"

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

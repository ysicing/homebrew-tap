cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.5.0"
  sha256 arm:   "878b716f276e009b19526f5d994007866888d24a27bf5b4f4bd3441fde60e4e7",
         intel: "3f6ca7b34a08cd8b1eadbf47154ca60b1d3da2143d46a5c3989bd8b146a141ae"

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

cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.2"
  sha256 arm:   "8c2a682179439e610e16ede86c979e9cf1ff7925fa3ec762908921e475220a6f",
         intel: "90888b251f985956a47e713a4d8f3bbe3f3de4d82de8a4f09f1178ae4874ac3c"

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

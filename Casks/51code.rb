cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0"
  sha256 arm:   "650d5294cfdcfa9231af34b143d86ff1c7d47046b21bb0c8886117b8eac04d2d",
         intel: "61de0c09a8d7da6c26754d3ec8505c40964e75378ac0b50b5cdf4b40a056bcd7"

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

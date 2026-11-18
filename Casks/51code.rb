cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.2"
  sha256 arm:   "700b0e3bedea8535b156812303d27862c86f2e3981c4c6c1a14bb8ba7723f819",
         intel: "8587087c45b60ac6cbabcabacf8f5ff2e5e3eb028caa5edca900a18988be3a3a"

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

cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.6.0"
  sha256 arm:   "32b0786530c6aa52eb20eafca318b0d8fa55aecb9fff733af31f70b3e0c62acd",
         intel: "c7a96cee42c35a3997a207a5f0b1a8200e10b3141668cba350fa910732852d48"

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

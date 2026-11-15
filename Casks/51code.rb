cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.0"
  sha256 arm:   "7d110f1657e55e2f0bca821eabf7eb4d249488fdddb9afa95fe959a01b69200f",
         intel: "a2b6095d693d15e0fdb2e322f5974d57af735a37d848c606bcb979b894d8dde1"

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

cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.5.2"
  sha256 arm:   "59268628757135bc6df01bf064b4315f43586f4e6dce740f08c784ad8d38c8f3",
         intel: "2ca3438fad12bbe36eb68b0705558c466b765739e7dc0c280925d8b51f790c1c"

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

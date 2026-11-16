cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.1"
  sha256 arm:   "f71c2641d9028d331f844a0c5d04ff7c206a3d1068ddd239cc29d34786ccfd0a",
         intel: "2c8e2809927dcab167abe292fe1bf906f5c3c7a04371110c7b5c14369664bffe"

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

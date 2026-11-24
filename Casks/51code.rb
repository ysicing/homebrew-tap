cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.5.1"
  sha256 arm:   "466c550d801a0530561bef3550cd0f16f9c9612f2461adf2dbbbb0bd5fa75526",
         intel: "1b1dba476bd66df233d698590ae3b177ad1b926005105bffa56bc700a7a01707"

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

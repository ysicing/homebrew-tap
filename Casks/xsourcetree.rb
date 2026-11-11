cask "xsourcetree" do
  arch arm: "arm64", intel: "amd64"

  version "0.0.4"
  sha256 arm:   "dc0a5d7b712fe6706e7cdea7d2c54576747aa6fef80ca62a4d4ad0d33dac6bc9",
         intel: "da94aafbc70bfcb317bc4d3e1635f42a6df8941f137874755d50c0dbb4d81108"

  url "https://c.ysicing.net/oss/apps/macOS/XSourceTree/xsourcetree-#{version}-#{arch}.dmg"
  name "XSourceTree"
  desc "Lightweight native Git client"
  homepage "https://github.com/ysicing/homebrew-tap#xsourcetree"

  livecheck do
    url "https://c.ysicing.net/oss/apps/macOS/XSourceTree/update-darwin-arm64.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "XSourceTree.app"

  uninstall quit: "com.ysicing.xsourcetree"
end

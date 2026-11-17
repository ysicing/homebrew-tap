cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.3"
  sha256 arm:   "6bf6c91e87f9905a0acf8c0d76f9b202af863f21f635078317ea3a1729b665cd",
         intel: "b3efa6937b2f8d819b8778b69077b8e08d3291ed01e614c1414d6094a5bddf9d"

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

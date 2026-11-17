cask "51code" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.1"
  sha256 arm:   "03f08783c77b5d7ee0f5129142606d80ee8c3cb463c91bf78dfc3bf3ddec4a90",
         intel: "543f6410bef6caffe1a5e4b8ab0a01f483e211bab8c1d7093111c33d42850dd3"

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

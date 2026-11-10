cask "xsourcetree" do
  arch arm: "arm64", intel: "amd64"

  version "0.0.2"
  sha256 arm:   "4bfd64065bd63837f5d147c87c763a18d7d31652d843202d9f3550bd4619a652",
         intel: "cc247294a29da91b741e9c8923dd97358212ae87bf3de619c4d7fcf4357c0d25"

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

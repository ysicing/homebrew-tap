cask "genworld" do
  version "1.1.0"
  sha256 "378c52f052da4dc78bedb6e039d1583f190683fab5663205e6bbe880d5465694"

  url "https://c.ysicing.net/oss/apps/macOS/GenWorld/GenWorld-#{version}-AppleSilicon.dmg"
  name "GenWorld"
  desc "Native macOS client for LLM services"
  homepage "https://github.com/ysicing/GenWorld"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "GenWorld.app"
end

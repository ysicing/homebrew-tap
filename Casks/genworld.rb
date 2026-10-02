cask "genworld" do
  version "1.0.1"
  sha256 "755f257c59d1e1b6774b73d82511e0fcffb65a34ebe78e2f7b6a36ab0317ada9"

  url "https://c.ysicing.net/oss/apps/macOS/GenWorld/GenWorld-#{version}-AppleSilicon.dmg"
  name "GenWorld"
  desc "Native macOS client for LLM services"
  homepage "https://github.com/ysicing/GenWorld"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "GenWorld.app"
end

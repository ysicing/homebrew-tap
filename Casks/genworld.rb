cask "genworld" do
  version "1.0.0"
  sha256 "84c3f3979497d1f6d04c235bbbb0c3fb57a497fbb5824ee60d813f3804a33ab8"

  url "https://c.ysicing.net/oss/apps/macOS/GenWorld/GenWorld-#{version}-AppleSilicon.dmg"
  name "GenWorld"
  desc "Native macOS client for LLM services"
  homepage "https://github.com/ysicing/GenWorld"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "GenWorld.app"
end

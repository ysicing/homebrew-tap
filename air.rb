
class Air < Formula
    desc "Live reload for Go apps"
    homepage "https://github.com/cosmtrek/air"
    version "1.40.4"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_darwin_arm64"
        sha256 "e8db89533845f9efb7c0d9f3f98c60decf9fdd909cc2fbe9161fedb7d5d9a25c"
      else
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_darwin_amd64"
        sha256 "48d17c3c0d52a29d8d2bc6c5c53ce86e3375dd2aeb5fc5ff01cb8be0019f0f4a"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_linux_amd64"
        sha256 "9920c80b517d9cf8f6eada7793ac5bcfc1db5dca1fbc4cc875df76c49daaef09"
      end
    end

    def install
      if Hardware::CPU.intel?
        bin.install "air_#{version}_darwin_amd64" => "air"
      else
        bin.install "air_#{version}_darwin_arm64" => "air"
      end
    end
  end

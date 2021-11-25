
class Air < Formula
    desc "Live reload for Go apps"
    homepage "https://github.com/cosmtrek/air"
    version "1.27.5"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_darwin_arm64"
        sha256 "a70d22b01b8b84f98afb7401f4b191172fbdf1749f86b5e26c71e7a9fb4f3c6a"
      else
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_darwin_amd64"
        sha256 "28af8f514f2513b32975ca17ba3aea3472ea22361e9db7eb804bd9b21e4d757b"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_linux_amd64"
        sha256 "d6f058729c2b6b959d086055c81f9c5838ac6c0e3be9a04d3c5d3986e2f035a6"
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

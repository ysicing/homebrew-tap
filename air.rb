
class Air < Formula
    desc "Live reload for Go apps"
    homepage "https://github.com/cosmtrek/air"
    version "1.27.3"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_darwin_arm64"
        sha256 "513459b8f737049ffa66cbdc91d785d676b164d3a79deb064562382f33eee4db"
      else
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_darwin_amd64"
        sha256 "41799175111823a992cb65325e2cdd5badc97cdcc0b3abd340d47bb30cb33bc7"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_linux_amd64"
        sha256 "68f8c0b1fb81fc2cda5fd2b16b857416f8c570072d0d7eaa06588b9bce3e2366"
      end
    end

    def install
      if Hardware::CPU.intel?
        bin.install "air_${version}_darwin_amd64" => "air"
      else
        bin.install "air_${version}_darwin_arm64" => "air"
      end
    end
  end

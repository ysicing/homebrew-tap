
class Air < Formula
    desc "Live reload for Go apps"
    homepage "https://github.com/air-verse/air"
    version "1.61.7"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/air-verse/air/releases/download/v#{version}/air_#{version}_darwin_arm64"
        sha256 "3a352c3586cfaebc4b984f5880a27660c688d004d25a2d125dbf67624d2cdda0"
      else
        url "https://github.com/air-verse/air/releases/download/v#{version}/air_#{version}_darwin_amd64"
        sha256 "ced4788d97fb773960acba4fe9c0fcc4f4e4955889cb28bddffd2d5bd99bed09"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/air-verse/air/releases/download/v#{version}/air_#{version}_linux_amd64"
        sha256 "5b0d6a0b659ad705902c08f6d3ce153e4a1f9b7f7ac29a0fb0919b5cefbe7469"
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

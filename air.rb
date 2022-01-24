
class Air < Formula
    desc "Live reload for Go apps"
    homepage "https://github.com/cosmtrek/air"
    version "1.27.9"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_darwin_arm64"
        sha256 "f940a18e3400931e30f07392955ad954c1cd4b6e6f287d936affe46c1349d545"
      else
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_darwin_amd64"
        sha256 "5e9fed862b4380f4b3ee6bb8f4110becae463382b89c5b062bc4902222f71c06"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_linux_amd64"
        sha256 "4003f8616a68d1a660366d3794d1d9b0f021fff55f4e5c0940ab525a6d3dc699"
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

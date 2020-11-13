class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.6"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "887242f983dd83e9d915a33a99d41dbe8ef4b77239f0a1de5863e6d6760ab475"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "3ee88020bd5202600458faae32281ba7808685c8e8e62e3b0fde052ada1d9d12"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

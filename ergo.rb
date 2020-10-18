class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.1"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "1b711d1cedf62ba4de19f2ebd763ffb603c7a6d10e477b8c57d47477a1c09e19"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "5cbb5b6c07d89b7dd347c438451ac3ec1f2141525db376efd8bcfe3dc975ac64"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

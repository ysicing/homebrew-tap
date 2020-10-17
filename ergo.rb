class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.1-alpha05"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "1bde0ce74c3d96018f980be8f67c98fc4d5ba1d1b5e55210ba170d3095f734da"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "01195d7c06de6e9bb2e4e706b860bc84b74d07bdaa00787d9629fe68072693e7"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

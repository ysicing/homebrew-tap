class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.12"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "a3dc2e32eeeba2d0e1c0914ccc4ee415134dc3512d361e0ee7fd285232825614"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "ed4c9c5c603f6ba7ac3c7409100c36c9e5f7d863692af302f2d7264e952108e8"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

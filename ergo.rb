class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "0.20.0"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "47a64029ab48d37bf898f2de08eb7abb6b849d8817d4ed156a4499797f6e4584"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "6b57fece7187bc82dca34ce1b7da559d56b67834833f0c93ac4a8316df5748c5"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

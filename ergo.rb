class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.3"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "1db44ad2fe6827d77f73c48a6507b343b92e872d991a7f87fb08bb9bf7e0163e"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "3f810798a9abe9eb0adf127b3ec2dac3dd687785ab81e5d812ad2411bd2e12f0"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

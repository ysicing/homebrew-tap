class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "0.11.0"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "e82e3707fa158e631f7feeb0b8d5ff022d08b626e5551e8b23c96f615ec47afd"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "b944c3fd669747e8c8f50f53ddb12ad4b06183c26bc9adf23b99ad2b84b3b53a"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

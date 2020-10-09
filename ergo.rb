class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.0-alpha03"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "0e944c6862656b511e6340a017dfe0d4d0d4c25bcc1cfda64f17b6c44348874f"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "04f54df0ebb56af77692d4cf61594ba87913496bde355091cdaf1fca2b43fcf3"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.0"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "682ef43601a5071c0cc606924263d20e8f657f52d072bdcc88333536dcf737eb"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "d7bf63c2b4680750338255a16becac06b14b2328a72e1dcdec21f27045d60f54"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

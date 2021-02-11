class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.13"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "d4d09b1d8ecbcb87b95efe615df65997d7d286ea76ab627f8629a5a19e6d5568"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "b3084e9474d3db00708e1d608b1bfc44e369a760440de1183230865e1d4b88cb"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "0.20.0"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "0585e9146feb7ffb352bb160dbe72def1bd2931e53626d40d2dd1268bdc61453"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "3ecb39e02a78b22473336a7a5eca5ea61ff2716e084de0206cb80e9c02f9d637"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

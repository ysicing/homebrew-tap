class Ergo < Formula
    desc "Devops tools 运维工具Ergo"
    homepage "https://github.com/ysicing/ergo"
    version "2.4.0-beta"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_arm64"
        sha256 "0f7986a2e0201dc9ccaac90dca6fcfe96deb14dd8166738c305821fd70c31cb5"
      else
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
        sha256 "f0c6ce938be592218511d4423797e039950453093a0afff31fa83c73fe6a72d6"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "351bde0b43f05278ec4ad922d00f036f796511d48310f5888f9251b2c1dcfa94"
      end
    end

    def install
      if Hardware::CPU.intel?
        bin.install "ergo_darwin_amd64" => "ergo"
      else
        bin.install "ergo_darwin_arm64" => "ergo"
      end 
    end
  end

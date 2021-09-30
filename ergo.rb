class Ergo < Formula
    desc "Devops tools 运维工具Ergo"
    homepage "https://github.com/ysicing/ergo"
    version "2.0.0-beta2"
    bottle :unneeded

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_arm64"
        sha256 "ed5cc723f8e8d5a7a6eda524e506be751fe40a74d4f943d7c140ecf52a9fd071"
      else
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
        sha256 "d614e461bfd89f157b9051989271d1e2bfe21283c92b6b4fc74ffc0b9fdac673"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "358827fbde781156c2e2c002a3be8a260ded2c9b896da3205c8c1e94c9198d89"
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

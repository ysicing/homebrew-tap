class Ergo < Formula
    desc "Devops tools 运维工具Ergo"
    homepage "https://github.com/ysicing/ergo"
    version "2.8.0"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_arm64"
        sha256 "7b736d1e3aaee6bce79252c68d2dd8f55e916c4d007866a4b4436f8bbe5d6836"
      else
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
        sha256 "a6e1886506547200495b9a20b5676acf07d55d3f31a6de87f464ba7ba2371817"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "b24c85c84c9ac5dae267324b92072b4f582fdc42908b29cae5ea0a36c7f2d22b"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_arm64"
        sha256 "1c2362421c682e0706ff447119713a39260b89e06a980c334acfda744ce67510"
      end
    end

    def install
      if OS.mac?
        if Hardware::CPU.intel?
          bin.install "ergo_darwin_amd64" => "ergo"
        else
          bin.install "ergo_darwin_arm64" => "ergo"
        end 
      elsif OS.linux?
        if Hardware::CPU.intel?
          bin.install "ergo_linux_amd64" => "ergo"
        else
          bin.install "ergo_linux_arm64" => "ergo"
        end 
      end
    end

    test do
      assert_match "ergo vervion v#{version}", shell_output("#{bin}/ergo version")
    end
end

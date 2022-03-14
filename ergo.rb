class Ergo < Formula
    desc "Devops tools 运维工具Ergo"
    homepage "https://github.com/ysicing/ergo"
    version "3.1.2"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_arm64"
        sha256 "8be95c7fa00d1fb9956cb3007e35879c6c3d4279ddcd646c48a9630f4b4c35f0"
      else
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
        sha256 "ce620684db7bf37cb791f88ac3aa516a0e6b67ab638af6ef72b80af5c5072b24"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "62ca1113430e1c0d63afde1b5e80e25251dba2656f442cfeb6cc959a7cb4d6dd"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_arm64"
        sha256 "1ca96165f8d866a0b0d49940f45ef49b0a76ed8154f0b30d13cd0a9e67de3dec"
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

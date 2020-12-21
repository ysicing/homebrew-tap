class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.11"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "33e769e05bd2dc1f604a9dca71b9c8e70745d72d5b38ac7fb87c6b9f2bccba44"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "7316b4231f324a39af88c8de22ea4f7b186ac8137d22c114a021ac1b0ac8af3f"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "0.20.0"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "ea2f7539a7a82919dea35b12738a4a39d63d287d0ebfe54c04da99b7160cb19d"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "3ce62324ebbeaeb8cacff1d0532d6274585fa43f9413da27f346af2ba117ae11"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

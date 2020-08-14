class Crtools < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/crtools"
    version "0.0.1"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_darwin_amd64"
      sha256 "9f431a7fd4c2705b8ea7b92da97f144b38ae8f122fea4d69bb780e6bfeb2372f"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_linux_amd64"
        sha256 "8e556a85b036c263b2a7cac29d367068d5eb24a72b02c966104d2c72134f0a07"
      end
    end

    def install
      bin.install "crtools_darwin_amd64" => "crtools"
    end
  end

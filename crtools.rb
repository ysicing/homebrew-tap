class Crtools < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/crtools"
    version "0.1.0"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_darwin_amd64"
      sha256 "c0f139959e10720f9e4afa42ed6b6a90fd1c542e58a5fb1108e697a9eb2fcdf1"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_linux_amd64"
        sha256 "a305161b552cb4d5e71c780cb9990fc632845cd87080ffef2cd3aa03e4c73163"
      end
    end

    def install
      bin.install "crtools_darwin_amd64" => "crtools"
    end
  end

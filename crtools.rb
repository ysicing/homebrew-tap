class Crtools < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/crtools"
    version "0.1.0"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_darwin_amd64"
      sha256 "a4205365dcd7686ac96ff00c4969837c8335ee6846f87f78af5c899fc54894f0"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_linux_amd64"
        sha256 "97251a3453b510e9f48c3c4147c84e98effd1f45a9609a1b2b87a4ddbf13a00f"
      end
    end

    def install
      bin.install "crtools_darwin_amd64" => "crtools"
    end
  end

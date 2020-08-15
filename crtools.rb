class Crtools < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/crtools"
    version "0.0.3"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_darwin_amd64"
      sha256 "ab6fc1f34079b7b4db83cfcdcac715395cf9df123decf67bc54ef99bba5c9eb8"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_linux_amd64"
        sha256 "2306adc4523a6e3e9cd347790e2782ca928a0f4524d8d6ee7e514106796797fa"
      end
    end

    def install
      bin.install "crtools_darwin_amd64" => "crtools"
    end
  end

class Ysssh < Formula
    desc "Devops tools 运维工具 ysssh"
    homepage "https://github.com/ysicing/ssh"
    version "0.0.4"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ssh/releases/download/#{version}/ssh_darwin_amd64"
      sha256 "bad26866c290e1d27b7e8876e22a0a1d81bb97a188417e05c74108bde865c691"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ssh/releases/download/#{version}/ssh_linux_amd64"
        sha256 "bad26866c290e1d27b7e8876e22a0a1d81bb97a188417e05c74108bde865c691"
      end
    end

    def install
      bin.install "ssh_darwin_amd64" => "ysssh"
    end
  end


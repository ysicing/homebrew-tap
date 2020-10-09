class Ysssh < Formula
    desc "Devops tools 运维工具 ysssh"
    homepage "https://github.com/ysicing/ssh"
    version "0.0.3"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ssh/releases/download/#{version}/ssh_darwin_amd64"
      sha256 "a665d42978f252f7ac804cc51b7baf0486f0309a9a712dc1b531ddcde3520bbf"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ssh/releases/download/#{version}/ssh_linux_amd64"
        sha256 "a665d42978f252f7ac804cc51b7baf0486f0309a9a712dc1b531ddcde3520bbf"
      end
    end

    def install
      bin.install "ssh_darwin_amd64" => "ysssh"
    end
  end


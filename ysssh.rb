class Ysssh < Formula
    desc "Devops tools 运维工具 ysssh"
    homepage "https://github.com/ysicing/ssh"
    version "0.0.2"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ssh/releases/download/#{version}/ssh_darwin_amd64"
      sha256 "4f87debf86e88365b380f0fed2e3a1cee8221388a408fc0b3442988de0ba1746"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ssh/releases/download/#{version}/ssh_linux_amd64"
        sha256 "dc93b8355eb9f4fb3f9c3e40e4355e70b502fcc48bc9be31a80512b7ec27cef9"
      end
    end

    def install
      bin.install "ssh_darwin_amd64" => "ysssh"
    end
  end

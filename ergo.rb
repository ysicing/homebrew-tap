class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.0-alpha02"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "166a46dbba3a09e9e975fbc4787b62478fff8d32d931dfc5d287739452b5b995"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "94516dbadf29fd384f3252c6d9882fb42301c942ff2e7c046689318152e32808"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

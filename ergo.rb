class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.0"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "bd34ddf686478e4775a540e741636d1c57f3cff56b7d7fab6120336179172612"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "c2559dee8b61e264e43b7369f513e5f61db1e1091b288f31cf27085b17e78560"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

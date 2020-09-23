class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.0-alpha01"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "f5509d49b7a69a08332653cff59ea06ab1d1f4952700c026f8fadaba706ea637"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "449df6db655ea4989c7c952f19e5044c94b0ea455c70821c5c920bdfd53e9518"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

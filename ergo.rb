class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.1-alpha01"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "48fdca66b4e945a9b2cf2b639e384626893f5caa160a49b8fb77595b3c0e5db2"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "47f71bebdee5c07a93cd18fdb120aca6de26a4eb23fd21a408aa558763716405"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

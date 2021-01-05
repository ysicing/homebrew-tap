class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.12"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "51ecc5554b15dfa54a31de76f914cb1ad0a74c71c492ae5a7b5a706c292a3349"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "1e5837264da43ffad971fc628640d7768372d92e24223b8c31c682972a9751ea"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

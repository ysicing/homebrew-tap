class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.5"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "536dbccbbecab335da1c67071bf9ea9f07b63910bd0b54374a9172f21821d115"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "2cfeaf514119d92f0900a9364541c8c808d10d2a28e586a359c5e24b92fd1689"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

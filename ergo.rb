class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "0.10.4"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "cb28d346f98156b7ff03d67a6e8830b8ba7ea1934e9d5a335cd379ef8e91a1c8"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "71b89f43b432b66e20fbc968e401cbef05ac9b47c1518026fc0ef53f4235c413"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

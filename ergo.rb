class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.7"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "082803428b6ce7b62b81058e50635a3bacdac8048a7bfe078b9a18a6c5db34d8"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "078c7520a29c3cbfc9aa6827bc176c1659f619932be681a199a95ea1c9c37a71"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

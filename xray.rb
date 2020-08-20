
class Xray < Formula
    desc "一款功能强大的安全评估工具"
    homepage "https://github.com/chaitin/xray"
    version "1.2.0"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/chaitin/xray/releases/download/#{version}/xray_darwin_amd64.zip"
      sha256 "58c8a3d9fe07448f681ff104747e5fafb9d4f4d54fb3bf7d0362a462e892e9ab"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/chaitin/xray/releases/download/#{version}/xray_linux_amd64.zip"
        sha256 "9124f8b522fd2dc9603e1dd03ca422c1356138d1e609319a458ef3afa358695a"
      end
    end

    def install
      bin.install "xray_darwin_amd64" => "xray"
    end
  end

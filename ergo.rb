class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.7"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "3da6486b940ed51bfed2ee1c1102b112c706dda8db877a6a886a6b790cc779eb"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "e8a6da25f37eb13a96b1555f1d628e0bb79f2c4e992537aa16109140495bd134"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

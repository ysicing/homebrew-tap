class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.0-alpha07"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "266335c79c942ea1d9ceee540090f217755000dea646cb56c8a9c32c2284b7b2"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "67f9ae30d5cd87b8d950e7ffb95deede66b01098200b34a1f080e5b4fc1944af"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

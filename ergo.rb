class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.17"
    bottle :unneeded

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_arm64"
        sha256 "2619ba6cc32f659189b4d822a93cb9b6600259129bd71ac023c6f5baa65cad0f"
      else
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
        sha256 "959b203e45cbfb7a4eea76989bd9c94d12fbc6d87e5a887518dfe5a2a87ac53a"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "84e5bf185c643aa6c00681e6eff18474af9d51dfc02e2888cc9eb9742435cb1f"
      end
    end

    def install
      if Hardware::CPU.intel?
        bin.install "ergo_darwin_amd64" => "ergo"
      else
        bin.install "ergo_darwin_arm64" => "ergo"
      end 
    end
  end

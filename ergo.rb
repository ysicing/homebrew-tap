class Ergo < Formula
    desc "Devops tools 运维工具Ergo"
    homepage "https://github.com/ysicing/ergo"
    version "2.0.1"
    bottle :unneeded

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_arm64"
        sha256 "3b2a01807e8c732a35547e46ec4e66b748bcdbcf3a164e95d415f6b7c8797920"
      else
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
        sha256 "65d522398688b4e6a87054fcba4cffb608093be80339a7b056d9996cbc45bdad"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "cfb1aa9484ec615e7451534915da1c8efb5f47d5db9eacbaf0fd633c21eee7a0"
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

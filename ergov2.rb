class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "2.0.0-beta"
    bottle :unneeded

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_arm64"
        sha256 "7bd9028eaeb433998fe3352386e3d5c0b1335e5f38290b038758d684d21f0d27"
      else
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
        sha256 "5b4e7aadc34a7c8493361610043135c1db2bc921fbb15d803d72c2e91b7db5ba"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "239bc6e3383e9d2049a6de28215c7af901b931903701b039633ba872b5606df7"
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

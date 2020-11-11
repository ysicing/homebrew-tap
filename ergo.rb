class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.6-beta02"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "c3f3f3a814826c9fbb178eb6921541540654fcb3c68dc0f6501db3b92aca29cb"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "71159839e661af849df7e69164159ae91cb795423d68fb666dff24912ae1d762"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

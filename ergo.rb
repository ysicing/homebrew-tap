class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "0.10.3"
    bottle :unneeded
  
    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64.tar.gz"
      sha256 "784eb8c3b4176493d784bdc22e225c7fa4eae8494deb260b2ba67e897d9285ef"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64.tar.gz"
        sha256 "da657d3203968413b8ef1ffe22fceb3a1cee43138b9d8053366127e3662cd714"
      end
    end
  
    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end
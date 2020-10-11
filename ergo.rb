class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.0-alpha05"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "f60c5cede38f82db2f5dcecc192eb1b5130190b3c68d7a9cb4e814d5c6fe71eb"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "eea80de7e0b89083cffac570428d73ed613195e770ba0f72d7919c7f13cba998"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

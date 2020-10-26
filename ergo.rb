class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.4"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "69ff9a1a5d41953c6ef1d1e713701d9bde7f7ae0717149809f952e5d35d7529b"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "913d5f98d61dab9eea6734423c7df14f9f2b65731957ffa507e21176daa6227d"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

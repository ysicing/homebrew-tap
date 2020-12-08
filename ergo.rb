class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.8"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "76994e2b7096b5b593975a3f5507fa6e89df49b1208d0cc460ea87f409c1d60c"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "ff7ce87e564c9cc1e041eee7bdaf7e3e55cdfe8d6e9133c765c4f0764b626505"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

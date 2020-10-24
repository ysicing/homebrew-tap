class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.2"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "c0d730d6bc957cc7ef8d275f2e42a9399d95c8741e31d1299105a88daf04a8ae"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "607faef8a875b8bb7aa7b3ced6f893a1f7f44ab6c43a81b208e4f64d2cd0e4ff"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

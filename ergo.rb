class Ergo < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/ergo"
    version "1.0.2-alpha03"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
      sha256 "75a9a18b87f55d72c58599381d20d173de698cdffee71034828ae036ede2ebc6"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "111066b6f0226cd07154741e880c07d13592ec674e4c5ca5ffccfd00dfdda764"
      end
    end

    def install
      bin.install "ergo_darwin_amd64" => "ergo"
    end
  end

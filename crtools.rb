class Crtools < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/crtools"
    version "0.0.6"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_darwin_amd64"
      sha256 "dd7462c8ea38a13c8c05059d95cd4dbddf396a12a5d5fb2aebc9195a2fa82835"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_linux_amd64"
        sha256 "a1e3552c569152bb2d91c4b9da5886a43de7536f067f02a9e444fa121b77711c"
      end
    end

    def install
      bin.install "crtools_darwin_amd64" => "crtools"
    end
  end

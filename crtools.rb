class Crtools < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/crtools"
    version "0.0.2"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_darwin_amd64"
      sha256 "2820277581479312a1d2dae5fde2fc422905bca870e0475e717a0f6bfe56e120"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_linux_amd64"
        sha256 "94d13c0b73749b4cd8a4df65d405ffbd3d84bd106c27a108b70fd11c8ff40e99"
      end
    end

    def install
      bin.install "crtools_darwin_amd64" => "crtools"
    end
  end

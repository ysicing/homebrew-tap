class Crtools < Formula
    desc "Devops tools 运维工具"
    homepage "https://github.com/ysicing/crtools"
    version "0.0.7"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_darwin_amd64"
      sha256 "5c1fd2e4f436e912616cba8f6999504e9a7b65de91b6f419961c00fde1625bbe"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/crtools/releases/download/#{version}/crtools_linux_amd64"
        sha256 "641ca06b4a5d231d8c45e6353499a7c6cb67fb530505b524fe2bb7fa302e1501"
      end
    end

    def install
      bin.install "crtools_darwin_amd64" => "crtools"
    end
  end

class Kr < Formula
    desc "Devops tools kube-resource"
    homepage "https://github.com/ysicing/kube-resource"
    version "0.0.5"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_darwin_arm64"
        sha256 "5460ddd19b320a76355dd05a3240a6cbb6eef3f6b9528903973389735773326a"
      else
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_darwin_amd64"
        sha256 "0cdad8f7cba4c464a226101a0af4937170bb6ef41e181a26338f31cd991d9ecc"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_linux_amd64"
        sha256 "dfa9115f6b5e630aaf88b75f1013fbd79a2aeb7d4bb856336c51e5240a0136f9"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_linux_arm64"
        sha256 "46a5f6abf89650982d88ba4835df59499a2fc24e514db17e79fb335a0924958a"
      end
    end

    def install
      if OS.mac?
        if Hardware::CPU.intel?
          bin.install "kr_darwin_amd64" => "kr"
        else
          bin.install "kr_darwin_arm64" => "kr"
        end 
      elsif OS.linux?
        if Hardware::CPU.intel?
          bin.install "kr_linux_amd64" => "kr"
        else
          bin.install "kr_linux_arm64" => "kr"
        end 
      end
    end

    test do
      assert_match "kr vervion v#{version}", shell_output("#{bin}/kr version")
    end
end

class Kr < Formula
    desc "Devops tools kube-resource"
    homepage "https://github.com/ysicing/kube-resource"
    version "0.0.4"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_darwin_arm64"
        sha256 "77a0cfd48630e84caeaa766c5c1cfd07b83a0a59ae61c034540d448b6a0117b2"
      else
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_darwin_amd64"
        sha256 "9cc90d71f0bc95d8df7884f38e2028f131e8b7a711ce08e028979fa28382d80e"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_linux_amd64"
        sha256 "2d145211fa3792f443c7e55e7c301d293d8183c2ffc6063bb419c081a162e1a5"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_linux_arm64"
        sha256 "501cf99501271da9f7d706e46f974600da7279989999a6e326ba04ce6e2f0fe3"
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

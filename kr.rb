class KR < Formula
    desc "Devops tools kube-resource"
    homepage "https://github.com/ysicing/kube-resource"
    version "0.0.1"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_darwin_arm64"
        sha256 "29dd7972088163ececfc4bf2dc25f851a4cf19e975a69e6abb2715489490e898"
      else
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_darwin_amd64"
        sha256 "b26a36ca2812a6cb0d8d81d05931337963f49b354ededf523c6dad3f36623c8c"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_linux_amd64"
        sha256 "39c6b3f6863f0aada744df00060a9f9b0b936e6a8196ce895ebd98c275810638"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_linux_arm64"
        sha256 "99f0976ca24e390b9189db6b1824cdfa48ae5be544c679280919629b64c41248"
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

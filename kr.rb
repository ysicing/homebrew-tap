class Kr < Formula
    desc "Devops tools kube-resource"
    homepage "https://github.com/ysicing/kube-resource"
    version "0.0.2"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_darwin_arm64"
        sha256 "ed5864352511b24e078922d4e11d144eea3131dccd05be572bfe13736966ccb1"
      else
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_darwin_amd64"
        sha256 "9838814838787908850ef0e1574e1e3bb45bb643aa62dcd7b6db98424de5452e"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_linux_amd64"
        sha256 "9a5448402ee063ee9767fc16c4e55a1a3670263c8db48602d9bba3bbbe7792c0"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/kube-resource/releases/download/#{version}/kr_linux_arm64"
        sha256 "92a9c1dd55b5ca4a992d7170a9f1db802b23b4ea288d1a5bd6ce256801c22c86"
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

class Ergo < Formula
    desc "Devops tools 运维工具Ergo"
    homepage "https://github.com/ysicing/ergo"
    version "2.6.11"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_arm64"
        sha256 "b1b1f544874875f3bc923ca55eb06dac4681371b2564203d81d450ac0a368b54"
      else
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
        sha256 "6735c3537b774a38f940696c7b60af217cb1f8dc2d6b80250d9bd01464620a1f"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "580e76706dad83dbd9c29d5c66e58267c0bc23285c1d8daf4c656dcd56f8dd5e"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_arm64"
        sha256 "d59c94d588479633eaf01cf47cbcc9a2359427c4ee1d7dfb285a408a3caff58b"
      end
    end

    def install
      if OS.mac?
        if Hardware::CPU.intel?
          bin.install "ergo_darwin_amd64" => "ergo"
        else
          bin.install "ergo_darwin_arm64" => "ergo"
        end 
      elsif OS.linux?
        if Hardware::CPU.intel?
          bin.install "ergo_linux_amd64" => "ergo"
        else
          bin.install "ergo_linux_arm64" => "ergo"
        end 
      end
    end

    test do
      assert_match "ergo vervion v#{version}", shell_output("#{bin}/ergo version")
    end
end

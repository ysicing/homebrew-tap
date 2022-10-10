class Spotvm < Formula
    desc "spot vm tool"
    homepage "https://github.com/ysicing/spot"
    version "0.0.4"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/spot/releases/download/v#{version}/spot_darwin_arm64"
        sha256 "67de810a29d4f0bcba676e3ebfaec909dd3d4f3ad7462317f98f463e488a8052"
      else
        url "https://github.com/ysicing/spot/releases/download/v#{version}/spot_darwin_amd64"
        sha256 "daa1f671e248bfb8ef691003dcccdc9c2a8add1041d6d6b164a540cf6ff73195"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/spot/releases/download/v#{version}/spot_linux_amd64"
        sha256 "69f0ead82e8d9e90a7504baab45063e3de3e643e680c78a90a06d67817aaa78c"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/spot/releases/download/v#{version}/spot_linux_arm64"
        sha256 "a7809868e1423d8aa3aebed6938dd3a35c36ab3f748932abdc7719ed6472748a"
      end
    end

    def install
      if OS.mac?
        if Hardware::CPU.intel?
          bin.install "spot_darwin_amd64" => "spotvm"
        else
          bin.install "spot_darwin_arm64" => "spotvm"
        end
      elsif OS.linux?
        if Hardware::CPU.intel?
          bin.install "spot_linux_amd64" => "spotvm"
        else
          bin.install "spot_linux_arm64" => "spotvm"
        end
      end
    end

    test do
      assert_match "spotvm vervion v#{version}", shell_output("#{bin}/spotvm -v")
    end
end

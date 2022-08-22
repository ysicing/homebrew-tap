class Spotvm < Formula
    desc "spot vm tool"
    homepage "https://github.com/ysicing/spot"
    version "0.0.1"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/spot/releases/download/v#{version}/spot_darwin_arm64"
        sha256 "d84cd9f12b770b09e4a766db48349e5874ddeeef330c2d38c8b494ebef227cc7"
      else
        url "https://github.com/ysicing/spot/releases/download/v#{version}/spot_darwin_amd64"
        sha256 "cd5106de14c0b3caecd475aed6603ea9b2a16a81c99eec7802a87c3a1c2407f3"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/spot/releases/download/v#{version}/spot_linux_amd64"
        sha256 "11038a71d30c4d0ade6ef7646c7ac47c13dc8b4cfbcb2c6f6db161a9eb38df87"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/spot/releases/download/v#{version}/spot_linux_arm64"
        sha256 "46092bcdf2b8157af568f6751ffa0ca9a3b9a4335ea3b925dcd2ccbc131216d9"
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

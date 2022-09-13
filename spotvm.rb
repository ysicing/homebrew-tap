class Spotvm < Formula
    desc "spot vm tool"
    homepage "https://github.com/ysicing/spot"
    version "0.0.2"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/spot/releases/download/v#{version}/spot_darwin_arm64"
        sha256 "223adcf922797aa1c4e3ead9c989b1738f6276e7d5de6028a92ab29144519275"
      else
        url "https://github.com/ysicing/spot/releases/download/v#{version}/spot_darwin_amd64"
        sha256 "4eb4b601a889e0d49111e89a3e336d201013618a92cbf58cde694c4c42f441ae"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/spot/releases/download/v#{version}/spot_linux_amd64"
        sha256 "0f5ed138d251008636fede677efbb5fa5b85b8591b38a4b2ba8624c0cd9f108b"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/spot/releases/download/v#{version}/spot_linux_arm64"
        sha256 "7a4d984e6df4d3b6c080d222f7f816c3836977198eb8c0ed20ef986e41cdce3d"
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

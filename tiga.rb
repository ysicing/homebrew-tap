class Tiga < Formula
    desc "Simple and powerful tool for senior restart engineer"
    homepage "https://github.com/ysicing/tiga"
    version "0.3.1"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/tiga/releases/download/v#{version}/tiga_darwin_arm64"
        sha256 "7576edd01e6d77e6d122ee6c26ec5e911f01bf49a13385d704ce8009f14ac9a3"

        def install
            bin.install "tiga_darwin_arm64" => "tiga"
        end
      end

      if Hardware::CPU.intel?
        url "https://github.com/ysicing/tiga/releases/download/v#{version}/tiga_darwin_amd64"
        sha256 "7824af459fbbcc9fdcc5966f783a4b17244a25c253b281bb2c8afa06267fcd24"

        def install
            bin.install "tiga_darwin_amd64" => "tiga"
        end
      end
    end

    on_linux do
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/tiga/releases/download/v#{version}/tiga_linux_amd64"
        sha256 "f1bd76945bc590b6b0a69fedcd542b64ae35c6eb6cff5d0efe9877ec8511543c"

        def install
            bin.install "tiga_linux_amd64" => "tiga"
        end
      end

      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/tiga/releases/download/v#{version}/tiga_linux_arm64"
        sha256 "27d75b378c8d07f0ba04cd43afe3a34f2106021d94ef2941f5066a63232db5fc"

        def install
            bin.install "tiga_linux_arm64" => "tiga"
        end
      end
    end
end

class Coscli < Formula
    desc "tencentyun coscli"
    homepage "https://github.com/tencentyun/coscli"
    version "0.16.0-beta"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/tencentyun/coscli/releases/download/v#{version}/coscli-mac-m1"
        sha256 "2cea7482372be9ed09e3ae89c2ee8184809cb90348300b66c788f8a957426317"

        def install
            bin.install "coscli-mac-m1" => "coscli"
        end
      end

      if Hardware::CPU.intel?
        url "https://github.com/tencentyun/coscli/releases/download/v#{version}/coscli-mac"
        sha256 "d0715fe4a7cb647041509aa84c93fdb66d9652ed4ba448a6611b1dbcc2588992"

        def install
            bin.install "coscli-mac" => "coscli"
        end
      end
    end

    on_linux do
      if Hardware::CPU.intel?
        url "https://github.com/tencentyun/coscli/releases/download/v#{version}/coscli-linux"
        sha256 "bf8c221b2c59df598069a4eee3eebb35568f46c56c42d0c943dae42f02f2c22e"

        def install
            bin.install "coscli-linux" => "coscli"
        end
      end
    end
end

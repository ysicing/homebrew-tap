class Txcli < Formula
  desc "Tencent Cloud CLI for Lighthouse, DNSPod, EdgeOne and storage"
  homepage "https://cnb.cool/ysicing/txcli"
  version "1.0.1"

  on_macos do
    on_arm do
      url "https://cnb.cool/ysicing/txcli/-/releases/download/v#{version}/txcli_v#{version}_darwin_arm64.tar.gz"
      sha256 "eabdc43ea7191d29e5ae798b3d7432eff9b39656f7f9a53df1f953bd5b603983"
    end

    on_intel do
      url "https://cnb.cool/ysicing/txcli/-/releases/download/v#{version}/txcli_v#{version}_darwin_amd64.tar.gz"
      sha256 "858ee0e4259692d0ea13ed6f0ebde46a102ac29c796566326173fcdaaded2044"
    end
  end

  on_linux do
    on_arm do
      url "https://cnb.cool/ysicing/txcli/-/releases/download/v#{version}/txcli_v#{version}_linux_arm64.tar.gz"
      sha256 "a4189a1f23e966ff170629776d40b83dd2372d33aec0f6d31fa709538425fefb"
    end

    on_intel do
      url "https://cnb.cool/ysicing/txcli/-/releases/download/v#{version}/txcli_v#{version}_linux_amd64.tar.gz"
      sha256 "17add982ec7972024f76c0b73bdfab0fc77695cfaccad53546167b92f8ada786"
    end
  end

  def install
    bin.install "txcli"
  end

  test do
    assert_match "Lighthouse", shell_output("#{bin}/txcli --help")
    policy = JSON.parse(shell_output("#{bin}/txcli policygen --read-only"))
    assert_equal "2.0", policy.fetch("version")
  end
end

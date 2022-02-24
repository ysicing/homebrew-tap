
class Air < Formula
    desc "Live reload for Go apps"
    homepage "https://github.com/cosmtrek/air"
    version "1.29.0"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_darwin_arm64"
        sha256 "a8fc95ec2674e4fa07b6144da6ca90f884cf0f69ddcc52a0200a7694c7101222"
      else
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_darwin_amd64"
        sha256 "9288509879e69335425c03a44ee0f80ead313394cb477553a915a230b15c4f06"
      end
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_linux_amd64"
        sha256 "1210a1996e9ddab2242cec779122f7aa8375613b5c5db3dfa369f35bff0efe56"
      end
    end

    def install
      if Hardware::CPU.intel?
        bin.install "air_#{version}_darwin_amd64" => "air"
      else
        bin.install "air_#{version}_darwin_arm64" => "air"
      end
    end
  end

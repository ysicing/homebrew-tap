
class Air < Formula
    desc "Live reload for Go apps"
    homepage "https://github.com/cosmtrek/air"
    version "1.12.4"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_darwin_amd64"
      sha256 "f0b8fd407c598bc729c80a4393dec2b13b334fe3676f7e9bd2adf6ed132854ab"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/cosmtrek/air/releases/download/v#{version}/air_#{version}_linux_amd64"
        sha256 "104538accc548cc8d3779aed07794e77d1674088baad5d4e73e91f9576eb6244"
      end
    end

    def install
      bin.install "air_${version}_darwin_amd64" => "air"
    end
  end

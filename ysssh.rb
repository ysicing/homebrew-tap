class Ysssh < Formula
    desc "Devops tools 运维工具 ysssh"
    homepage "https://github.com/ysicing/ssh"
    version "0.0.1"
    bottle :unneeded

    if OS.mac?
      url "https://github.com/ysicing/ssh/releases/download/#{version}/ssh_darwin_amd64"
      sha256 "3ac18e30a2bf37123f5a0228c3b9e20273181ff33773d55e24120f7901dd0f59"
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ssh/releases/download/#{version}/ssh_linux_amd64"
        sha256 "ac594ce1b12b3d373b76344b6a61b4529fbbd8e7a48d90e3fc8f70f2da8747f3"
      end
    end

    def install
      bin.install "ssh_darwin_amd64" => "ysssh"
    end
  end

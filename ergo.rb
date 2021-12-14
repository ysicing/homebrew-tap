class Ergo < Formula
    desc "Devops tools 运维工具Ergo"
    homepage "https://github.com/ysicing/ergo"
    version "2.6.11"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_arm64"
        sha256 "f09dea846a5dcd30bb9fa395e92b983e868d8e4ee31bce67a23659183873631f"
      else
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
        sha256 "93bc918d1ca0b367de39480f903f37f342e24153c60c2bc9f684fe80e18dd691"
      end  
    on_linux do
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "add0ac4f4d2930cd1b7509ebe92bf3f5ab0aa943426c7364bd830e6b67f86452"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_arm64"
        sha256 "284f9c81d432169bb3a7b239c59db172e39e2c72b2fb8d061dbb7cd6049d88c4"
      end
    end

    def install
      if OS.mac?
        if Hardware::CPU.intel?
          bin.install "ergo_darwin_amd64" => "ergo"
        else
          bin.install "ergo_darwin_arm64" => "ergo"
        end 
      end
      if OS.linux?
        if Hardware::CPU.intel?
          bin.install "ergo_linux_amd64" => "ergo"
        else
          bin.install "ergo_linux_arm64" => "ergo"
        end 
      end

      # Install bash completion
      output = Utils.popen_read("#{bin}/ergo completion bash")
      (bash_completion/"ergo").write output

      # Install zsh completion
      output = Utils.popen_read("#{bin}/ergo completion zsh")
      (zsh_completion/"_ergo").write output
    end
end

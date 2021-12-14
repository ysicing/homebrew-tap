class Ergo < Formula
    desc "Devops tools 运维工具Ergo"
    homepage "https://github.com/ysicing/ergo"
    version "2.6.10"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_arm64"
        sha256 "8f6001b7da3d43b632e6855d6de625085b1d621a5b173368763019fc31648fee"
      else
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
        sha256 "e72a5293722bd3770846d96b82224a8b02061723ee7dc77f5d2f8b89c7593412"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "48f1158dccfa7af9e43b79d25858561a56db5ee06b772f102e5f1f76a15dcaa3"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_arm64"
        sha256 "2ee82cd87f6f011e4b69eee8eb9e31c28a84e1049f263a1b16d0742ab504fff9"
      end
    end

    def install
      if OS.mac?
        if Hardware::CPU.intel?
          bin.install "ergo_darwin_amd64" => "ergo"
        else
          bin.install "ergo_darwin_arm64" => "ergo"
        end 
      elsif OS.linux?
        if Hardware::CPU.intel?
          bin.install "ergo_linux_amd64" => "ergo"
        else
          bin.install "ergo_linux_arm64" => "ergo"
        end 
      end

      # Install bash completion
      output = Utils.safe_popen_read(bin/"ergo", "completion", "bash")
      (bash_completion/"ergo").write output

      # Install zsh completion
      output = Utils.safe_popen_read(bin/"ergo", "completion", "zsh")
      (zsh_completion/"_ergo").write output
      
      fish_output = Utils.safe_popen_read(bin/"ergo", "completion", "fish")
      (fish_completion/"ergo.fish").write fish_output
    end

    test do
      assert_match "ergo vervion v#{version}", shell_output("#{bin}/ergo version")
    end
end

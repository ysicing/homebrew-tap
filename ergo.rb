class Ergo < Formula
    desc "Devops tools 运维工具Ergo"
    homepage "https://github.com/ysicing/ergo"
    version "2.6.10"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_arm64"
        sha256 "b5ac218e3e139c0e3c425375a745ce1b4c23ea84df9be8ca5a0185cdaa244e89"
      else
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
        sha256 "cd93f8ab7bfdf4dee904d60501c487273cd3c58f938dce7d0a92ab1581bc34bb"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "82ab565be3b70a26dceade16bc69286fcdaaf34472951652c16188de3ba9bfa6"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_arm64"
        sha256 "31513f2dfed48c23941d86a59b872896ec7a3aa36bd092358c481ea2ccbf67be"
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

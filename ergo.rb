class Ergo < Formula
    desc "Devops tools 运维工具Ergo"
    homepage "https://github.com/ysicing/ergo"
    version "3.4.0"

    if OS.mac?
      if Hardware::CPU.arm?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_arm64"
        sha256 "aba209603e9e85ee30a1fef209eec21b69fbb9b0f9b4a9cd2590e834ba9a54f8"
      else
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_darwin_amd64"
        sha256 "7cd68fb21d9b950892300d0edf74695781978c07931a3a7a18c614aa000c8463"
      end  
    elsif OS.linux?
      if Hardware::CPU.intel?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_amd64"
        sha256 "f5a7636e89ee0357839f7586446cd11c70587b0742119938f812158ef33bc546"
      end
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/ysicing/ergo/releases/download/#{version}/ergo_linux_arm64"
        sha256 "4e1027d80ee83cfe4e217d60d426e708b618ad7d55c00f29a5439dab229224b8"
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
    end

    test do
      assert_match "ergo vervion v#{version}", shell_output("#{bin}/ergo version")
    end
end

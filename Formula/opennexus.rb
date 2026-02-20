class Opennexus < Formula
  desc "Thin CLI client for the Nexus context-driven development system"
  homepage "https://github.com/Alpha-Innovation-Labs/opennexus"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Alpha-Innovation-Labs/opennexus/releases/download/v0.1.7/opennexus-aarch64-apple-darwin"
      sha256 "db7936d39a15a485beb51ca6d18aba2ca208742e5ccf9a229e2c057b5672d8a3"
    else
      odie "No Homebrew binary is published for macOS Intel yet."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Alpha-Innovation-Labs/opennexus/releases/download/v0.1.7/opennexus-x86_64-unknown-linux-gnu"
      sha256 "a40d055ad1905b8a02b5366fa91dd41c6abe7b907247f5402f79221398f9db93"
    else
      odie "No Homebrew binary is published for Linux ARM yet."
    end
  end

  def install
    if OS.mac?
      bin.install "opennexus-aarch64-apple-darwin" => "opennexus"
    elsif OS.linux?
      bin.install "opennexus-x86_64-unknown-linux-gnu" => "opennexus"
    end
  end

  test do
    assert_match "opennexus", shell_output("#{bin}/opennexus --version")
  end
end

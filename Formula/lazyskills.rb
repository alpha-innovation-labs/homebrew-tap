class Lazyskills < Formula
  desc "Terminal UI for browsing and managing AI coding skills"
  homepage "https://github.com/Alpha-Innovation-Labs/lazyskills"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Alpha-Innovation-Labs/lazyskills/releases/download/v0.1.2/lazyskills-aarch64-apple-darwin"
      sha256 "fd61e01d9b73aac163cc3c938da75939c3631eab5f2170f47ed51f84661a4a9e"
    else
      odie "No Homebrew binary is published for macOS Intel yet."
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Alpha-Innovation-Labs/lazyskills/releases/download/v0.1.2/lazyskills-x86_64-unknown-linux-gnu"
      sha256 "962b34ea742fada4250675780609c5e3c89ecb50e740dcbed30ddf55ffc54988"
    else
      odie "No Homebrew binary is published for Linux ARM yet."
    end
  end

  def install
    if OS.mac?
      bin.install "lazyskills-aarch64-apple-darwin" => "lazyskills"
    elsif OS.linux?
      bin.install "lazyskills-x86_64-unknown-linux-gnu" => "lazyskills"
    end
  end

  test do
    assert_predicate bin/"lazyskills", :exist?
  end
end

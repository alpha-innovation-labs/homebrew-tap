class AgentSight < Formula
  desc "Query local OpenCode and Claude history from a Rust CLI"
  homepage "https://www.npmjs.com/package/agent-sight"
  url "https://registry.npmjs.org/agent-sight/-/agent-sight-0.1.1.tgz"
  sha256 "1f7ef0d5f15659a78f08fe7e38bd69304fe81ab032a33b6d9133482f6554eb70"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")

    node_modules = libexec/"lib/node_modules/agent-sight"
    os = OS.kernel_name.downcase
    arch = Hardware::CPU.intel? ? "x64" : "arm64"

    native_binary = "agent-sight-#{os}-#{arch}"

    (node_modules/"bin").glob("agent-sight-*").each do |file|
      if file.basename.to_s == native_binary
        file.chmod 0755
      else
        rm file
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-sight --version")
  end
end

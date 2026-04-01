class Twg < Formula
  desc "CLI wrapper for the Atlassian GraphQL Gateway API"
  homepage "https://bitbucket.org/atlassian/twg-cli"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/homebrew/0.7.2/twg-0.7.2-darwin-arm64.tar.gz"
      sha256 "c129c64b5c2b45d0fa02248f56db32e047a5bf8678297efbf05a32aa32d5aefc"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/homebrew/0.7.2/twg-0.7.2-darwin-x64.tar.gz"
      sha256 "1b9292055db6570e0cf8708958696d3a67fd68ff1a8a2ba21ebfee958f56b82d"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/homebrew/0.7.2/twg-0.7.2-linux-arm64.tar.gz"
      sha256 "6b224049d9ea45e29b3d60a76295eb7d455d613af2a30b9f80570769ba776d30"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/homebrew/0.7.2/twg-0.7.2-linux-x64.tar.gz"
      sha256 "724779121560e57160d7985ee785c73b9b0a2eb8318096675095f2e9822a2ecd"
    end
  end

  def install
    bin.install "twg"
  end

  def caveats
    <<~EOS
      Next steps:
        twg skills install --global --yes
        twg login
    EOS
  end

  test do
    output = shell_output("#{bin}/twg doctor -o json")
    assert_match "\"command\": \"doctor.get\"", output
    assert_match version.to_s, output
  end
end

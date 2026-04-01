class Twg < Formula
  desc "CLI wrapper for the Atlassian GraphQL Gateway API"
  homepage "https://bitbucket.org/atlassian/twg-cli"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/homebrew/0.7.1/twg-0.7.1-darwin-arm64.tar.gz"
      sha256 "13765da2e5d8ec7fab2d18169f22a5ede664e0bcc30390a363cc30fa8b097103"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/homebrew/0.7.1/twg-0.7.1-darwin-x64.tar.gz"
      sha256 "3fcf5e55e9e5e9f41b2a0801fabb6dac9b98f0cdc1ba4ecfcd56000385e52ec9"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/homebrew/0.7.1/twg-0.7.1-linux-arm64.tar.gz"
      sha256 "dfc06d03f750cbff87d69cd8f1ac063be0585cf1f5e573374a327716cb3ceabb"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/homebrew/0.7.1/twg-0.7.1-linux-x64.tar.gz"
      sha256 "18b94144815a8aed8b9898ed255bf2b4f18c2335b5b776f11a66fd6462e91408"
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

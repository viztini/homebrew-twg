class Twg < Formula
  desc "CLI wrapper for the Atlassian GraphQL Gateway API"
  homepage "https://bitbucket.org/atlassian/twg-cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/homebrew/0.7.0/twg-0.7.0-darwin-arm64.tar.gz"
      sha256 "8884859022dfac589bd00c541b02198c401a3e9a4e236fdf084c197dd8efcdbb"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/homebrew/0.7.0/twg-0.7.0-darwin-x64.tar.gz"
      sha256 "e54270553a3bc730402b0d395c3fd1c060f8092212e95f943e460008e6fcf3fc"
    end
  end

  on_linux do
    on_arm do
      url "https://teamwork-graph.atlassian.com/cli/homebrew/0.7.0/twg-0.7.0-linux-arm64.tar.gz"
      sha256 "60f52fff33ec55de5cdd42d00bc7e611d42115ab91bcc775eda32c33649f808e"
    end
    on_intel do
      url "https://teamwork-graph.atlassian.com/cli/homebrew/0.7.0/twg-0.7.0-linux-x64.tar.gz"
      sha256 "734536b8065bb438e93a9033cc4bea4e11eb0bff2064d9d0542850322094ab73"
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

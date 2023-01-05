class InklecateAT111 < Formula
  inklecate_version = "1.1.1"

  desc "Compiler and runtime for inkle's ink"
  homepage "https://www.inklestudios.com/ink/"
  url "https://github.com/inkle/ink/releases/download/v#{inklecate_version}/inklecate_mac.zip"
  version inklecate_version
  sha256 "c516402bca5fa249a7712e62591b048b137eba3098c53f9fb85a4253f9b9e2c0"

  keg_only :versioned_formula

  def install
    libexec.install Dir["*"]

    (bin/"inklecate").write <<~EOS
      #!/bin/bash
      #{libexec}/inklecate "$@"
    EOS
  end

  test do
    test_str = "Hello Ink"
    test_ink = "test.ink"

    (testpath/test_ink).write <<~EOS
      #{test_str}
    EOS

    output = shell_output("#{bin}/inklecate -p #{test_ink}")
    assert_match test_str, output.strip
  end
end

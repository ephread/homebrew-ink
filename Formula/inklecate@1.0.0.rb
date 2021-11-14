class InklecateAT100 < Formula
  inklecate_version = "1.0.0"

  desc "Compiler and runtime for inkle's ink"
  homepage "https://www.inklestudios.com/ink/"
  url "https://github.com/inkle/ink/releases/download/v#{inklecate_version}/inklecate_mac.zip"
  version inklecate_version
  sha256 "b6f4dd1f95c180637ce193dbb5fa6d59aeafe49a2121a05b7822e6cbbaa6931f"

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

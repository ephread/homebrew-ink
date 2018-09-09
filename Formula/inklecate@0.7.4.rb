class InklecateAT074 < Formula
  inklecate_version = "0.7.4"

  desc "Compiler and runtime for inkle's ink"
  homepage "https://www.inklestudios.com/ink/"
  url "https://github.com/inkle/ink/releases/download/#{inklecate_version}/inklecate_windows_and_linux.zip"
  version inklecate_version
  sha256 "ca22ef5332b16fdf48ff40ac82d7e22e42dd64f786f62e8f680a13ac09ccde5f"

  bottle :unneeded
  keg_only :versioned_formula

  depends_on "mono" => :recommended

  def install
    libexec.install Dir["*"]

    (bin/"inklecate").write <<~EOS
      #!/bin/bash
      mono #{libexec}/inklecate.exe "$@"
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

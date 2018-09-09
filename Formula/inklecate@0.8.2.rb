class InklecateAT082 < Formula
  inklecate_version = "0.8.2"

  desc "Compiler and runtime for inkle's ink"
  homepage "https://www.inklestudios.com/ink/"
  url "https://github.com/inkle/ink/releases/download/#{inklecate_version}/inklecate_windows_and_linux.zip"
  version inklecate_version
  sha256 "95532b9a6d6a65949c6405fac6fc49dfbf2cb2c943ea93cb87ed3db5a795950b"

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

class Inklecate < Formula
  inklecate_version = "0.8.3"

  desc "Compiler and runtime for inkle's ink"
  homepage "https://www.inklestudios.com/ink/"
  url "https://github.com/ephread/ink/releases/download/#{inklecate_version}/inklecate_windows_and_linux.zip"
  version inklecate_version
  sha256 "47427013d27c33efe0789fd6bd144f8aa02c7a1c942e8887c00bdf1dd950cb85"

  bottle :unneeded

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

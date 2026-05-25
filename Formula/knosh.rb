class Knosh < Formula
  desc "AI coding agent CLI"
  homepage "https://knosh.commonsware.com"
  url "https://knosh.commonsware.com/binaries/0.1.0/knosh-all.jar"
  sha256 "068fc7e0c41a5cae00d0ef19b96aa3ecbb9ea8cf4f742ee91e90bd89203f4c15"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install "knosh-all.jar"
    (bin/"knosh").write <<~EOS
      #!/bin/bash
      export JAVA_HOME="#{Formula["openjdk@21"].opt_prefix}"
      exec "${JAVA_HOME}/bin/java" -jar "#{libexec}/knosh-all.jar" "$@"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/knosh --version")
  end
end

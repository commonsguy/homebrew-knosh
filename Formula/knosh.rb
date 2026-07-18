class Knosh < Formula
  desc "AI coding agent CLI"
  homepage "https://knosh.commonsware.com"
  url "https://knosh.commonsware.com/binaries/0.3.0/knosh-all.jar"
  sha256 "69a39932a2f736335b051dfe572a4b65e0aec751ec0c895f9ce54e2bdcaa9113"
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

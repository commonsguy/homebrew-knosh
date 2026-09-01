class Knosh < Formula
  desc "AI coding agent CLI"
  homepage "https://knosh.commonsware.com"
  url "https://knosh.commonsware.com/binaries/0.4.0/knosh-all.jar"
  sha256 "1e360429f58a1e79b467ae13bf49c5450d92b1da2d5541db22be020226b3d50f"
  license "Apache-2.0"

  depends_on "openjdk@21"

  def install
    libexec.install "knosh-all.jar"
    (bin/"knosh").write <<~EOS
      #!/bin/bash
      export JAVA_HOME="#{formula_opt_prefix("openjdk@21")}"
      exec "${JAVA_HOME}/bin/java" -jar "#{libexec}/knosh-all.jar" "$@"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/knosh --version")
  end
end

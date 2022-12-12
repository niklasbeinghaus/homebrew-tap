class Terve < Formula
  desc "Unified, minimal terraform and terragrunt version manager."
  homepage "https://github.com/superblk/terve"
  url "https://github.com/superblk/terve/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "51b5c187085b8e8513d6229eae27b88eabc6b3264d8785523c39a7272b40f6dd"
  license "MIT"
  depends_on "rust" => :build
  conflicts_with "terragrunt", because: "terve manages terragrunt installations"
  conflicts_with "terraform", because: "terve mangages terraform installations"

  def install
        system "cargo", "install", *std_cargo_args
        system bin/"terve", "--bootstrap"
  end

  def caveats
    return
    <<~EOS
      By default, binaries installed by terve will be placed into:
      ~/.terve/bin
      You may want to add this to your PATH.

      If you want to verify terraform installations, 
      put the public Hashicorp PGP Key
      from https://www.hashicorp.com/security to
      ~/.terve/etc/terraform.asc
    EOS
  end

  test do
    assert_match "0.40.0", shell_output("#{bin}/terve l tg r")
    assert_match "1.0.0", shell_output("#{bin}/terve l tf r")
  end
end


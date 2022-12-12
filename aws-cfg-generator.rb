class AwsCfgGenerator < Formula
  desc "aws-cfg-generator is a CLI tool to generate configs for AWS helper tools based on an IAM user's permissions."
  homepage "https://github.com/moia-oss/aws-cfg-generator"
  url "https://github.com/moia-oss/aws-cfg-generator/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "a1c8460080b93b655e0a64224f94675f5faeef885470167cd89a448521eba300"
  license "Apache-2.0"
  depends_on "go" => [:build, :test]


  def install
    system "go", "build", *std_go_args, "aws-cfg-generator/main.go"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/aws-cfg-generator --help")
  end
end


class PackIdTool < Formula
  include Language::Python::Virtualenv

  desc "CLI tool to modify Cribl pack IDs in .crbl files"
  homepage "https://github.com/gcribl/pack-cli"
  url "https://github.com/gcribl/pack-cli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
    # Install shell completions
    bash_completion.install "completions/pack-id.bash" => "pack-id"
    zsh_completion.install "completions/_pack-id"
    fish_completion.install "completions/pack-id.fish"
  end

  test do
    system "#{bin}/pack-id", "--help"
  end
end


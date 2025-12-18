class PackIdTool < Formula
  include Language::Python::Virtualenv

  desc "CLI tool to modify Cribl pack IDs in .crbl files"
  homepage "https://github.com/gcribl/pack-cli"
  url "https://github.com/gcribl/pack-cli/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "436ff67a55b2fb080df95bf7481c9ea931499f3d3a89476526cb658b5795788a"
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


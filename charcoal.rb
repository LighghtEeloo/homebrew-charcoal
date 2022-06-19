class Charcoal < Formula
  desc "An online dictionary using youdao dict api. Inspired by wudao-dict."
  homepage "https://github.com/LighghtEeloo/Charcoal"
  url "https://github.com/LighghtEeloo/Charcoal/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "02db8a22b2a01831af034e5ac8353258471d00f5959484967137b349a1eba3b6"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    prefix.install "Readme.md"
    prefix.install "LICENSE"
  end

  test do
  end
end

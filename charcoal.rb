class Charcoal < Formula
  desc "An online dictionary using youdao dict api. Inspired by wudao-dict."
  homepage "https://github.com/LighghtEeloo/charcoal"
  url "https://github.com/LighghtEeloo/Charcoal/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "650841927eb8db80ed2bd23442cb270260ff730ca638269341033a84758f7ef8"
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

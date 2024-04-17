class Charcoal < Formula
  desc "An online dictionary using youdao dict api. Inspired by wudao-dict."
  homepage "https://github.com/LighghtEeloo/charcoal"
  url "https://github.com/LighghtEeloo/charcoal/releases/download/v0.2.8/charcoal-aarch64-apple-darwin"
  sha256 "829c088a3acd64b4c001221e4077771bc797c743a0037db82d399b880ea5fb58"
  license "MIT"

  depends_on "rust" => :build

  def install
    bin.install "charcoal-aarch64-apple-darwin" => "charcoal"
  end

  test do
  end
end

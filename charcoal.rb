# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Charcoal < Formula
  desc "An online dictionary using youdao dict api. Inspired by wudao-dict."
  homepage "https://github.com/LighghtEeloo/Charcoal"
  url "https://github.com/LighghtEeloo/Charcoal/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7dcd85a143c9b503edc39f716fcc45445847da7cb46654ea58bbc26deaeb661b"
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

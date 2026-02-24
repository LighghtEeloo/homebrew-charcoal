class CharcoalDict < Formula
  desc "A command line dictionary"
  homepage "https://github.com/LighghtEeloo/charcoal"
  version "0.3.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LighghtEeloo/charcoal/releases/download/v0.3.1/charcoal-dict-aarch64-apple-darwin.tar.xz"
      sha256 "4f839703e1e2986de1ee66a235fc7fc415165ed8b265d8857b6b02ce213c048f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LighghtEeloo/charcoal/releases/download/v0.3.1/charcoal-dict-x86_64-apple-darwin.tar.xz"
      sha256 "89f11811f3bac218f5561c36337ca5ca84b23139d3086fa26a832c3a6eda4991"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/LighghtEeloo/charcoal/releases/download/v0.3.1/charcoal-dict-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e6f6e7d65f2ee65deaae907f881b4ae912189ae331b583a63fcb246e4934a592"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LighghtEeloo/charcoal/releases/download/v0.3.1/charcoal-dict-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "04c4b063087e04ebbb3199cc0222df0f06254be5e4140feaa897ab86c5537d8b"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "charcoal" if OS.mac? && Hardware::CPU.arm?
    bin.install "charcoal" if OS.mac? && Hardware::CPU.intel?
    bin.install "charcoal" if OS.linux? && Hardware::CPU.arm?
    bin.install "charcoal" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end

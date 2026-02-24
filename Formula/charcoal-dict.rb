class CharcoalDict < Formula
  desc "A command line dictionary"
  homepage "https://github.com/LighghtEeloo/charcoal"
  version "0.3.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/LighghtEeloo/charcoal/releases/download/v0.3.2/charcoal-dict-aarch64-apple-darwin.tar.xz"
      sha256 "d47715fd70670bda1dc9828da96ddb3a81ef4881050023e9a9673c3117c53de6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LighghtEeloo/charcoal/releases/download/v0.3.2/charcoal-dict-x86_64-apple-darwin.tar.xz"
      sha256 "cbca58abd85725375c9a4e8abdb9c2b5f26e3efffc830e4f856473970970e758"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/LighghtEeloo/charcoal/releases/download/v0.3.2/charcoal-dict-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9c117e8f2b973470e3acb93f1bbe0582291b4eb965c7a6b1720492154d7f17a9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/LighghtEeloo/charcoal/releases/download/v0.3.2/charcoal-dict-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "714d253255780674b81f0214851b71d75f1fecff660bc220ba69e2ae7be69649"
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

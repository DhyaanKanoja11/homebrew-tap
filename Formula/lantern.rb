# typed: false
# frozen_string_literal: true

# Homebrew Formula for Lantern (https://github.com/DhyaanKanoja11/Lantern)
class Lantern < Formula
  desc "Local-first developer security tool explaining service reachability causality"
  homepage "https://github.com/DhyaanKanoja11/Lantern"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DhyaanKanoja11/Lantern/releases/download/v0.2.2/lantern_0.2.2_darwin_arm64.tar.gz"
      sha256 "f28cc3775f3c21e5363ada8284fa7a24987ec94f682a31a36f7549fb29d8b194"

      def install
        bin.install "lantern"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/DhyaanKanoja11/Lantern/releases/download/v0.2.2/lantern_0.2.2_darwin_amd64.tar.gz"
      sha256 "f7424681154c5e62caf49bc62a5b81668fe96d8bd422a4782b876bab6cf98fde"

      def install
        bin.install "lantern"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/DhyaanKanoja11/Lantern/releases/download/v0.2.2/lantern_0.2.2_linux_arm64.tar.gz"
      sha256 "844800568aec1ea874ea3917acda1cf82a77e0a3889e19be04437437eb5f1ca3"

      def install
        bin.install "lantern"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/DhyaanKanoja11/Lantern/releases/download/v0.2.2/lantern_0.2.2_linux_amd64.tar.gz"
      sha256 "b051b78fecab2fa3308560adb964f05a066cc4642abb6b25c6f5f347638ac799"

      def install
        bin.install "lantern"
      end
    end
  end

  def caveats
    <<~EOS
      Lantern requires Linux or WSL2 kernel socket interfaces (/proc/net/tcp, ss)
      for full socket discovery and process attribution. On macOS, diagnostic commands
      ('doctor', 'version') operate natively, while live socket inspection is designed
      for Linux and WSL2 development environments.
    EOS
  end

  test do
    assert_match "lantern v#{version}", shell_output("#{bin}/lantern version")
  end
end

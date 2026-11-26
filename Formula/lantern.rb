# typed: false
# frozen_string_literal: true

# Homebrew Formula for Lantern (https://github.com/DhyaanKanoja11/Lantern)
class Lantern < Formula
  desc "Local-first developer security tool explaining service reachability causality"
  homepage "https://github.com/DhyaanKanoja11/Lantern"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DhyaanKanoja11/Lantern/releases/download/v0.4.1/lantern_0.4.1_darwin_arm64.tar.gz"
      sha256 "7942a207cce48af0163bb0916014c9b674947a5e06bfbcb9231de1db81bd1c43"

      def install
        bin.install "lantern"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/DhyaanKanoja11/Lantern/releases/download/v0.4.1/lantern_0.4.1_darwin_amd64.tar.gz"
      sha256 "cfcab00ea330f10f7551ae362f10a71e06f566e475a80c1aa4d547ccbad637ea"

      def install
        bin.install "lantern"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/DhyaanKanoja11/Lantern/releases/download/v0.4.1/lantern_0.4.1_linux_arm64.tar.gz"
      sha256 "c3755baf9f05dcdefd73f5217ad2eaf7f3ca41ba1aa2b3fd015eff8a86d7e429"

      def install
        bin.install "lantern"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/DhyaanKanoja11/Lantern/releases/download/v0.4.1/lantern_0.4.1_linux_amd64.tar.gz"
      sha256 "90ed0bedcc0253f811a6fe2fc370523def0f12de6ff0e56344c7e12b75552514"

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

# typed: false
# frozen_string_literal: true

# Homebrew Formula for Lantern (https://github.com/DhyaanKanoja11/Lantern)
class Lantern < Formula
  desc "Local-first developer security tool explaining service reachability causality"
  homepage "https://github.com/DhyaanKanoja11/Lantern"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DhyaanKanoja11/Lantern/releases/download/v0.2.3/lantern_0.2.3_darwin_arm64.tar.gz"
      sha256 "f711911bd51b99d421b392067f0cc2ec6c01a371ca20090dd3466f52fc1eedb6"

      def install
        bin.install "lantern"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/DhyaanKanoja11/Lantern/releases/download/v0.2.3/lantern_0.2.3_darwin_amd64.tar.gz"
      sha256 "ddb06a75d1d4be11b95d28aace516fc5497c50a1548e04a3031477d801ef8e93"

      def install
        bin.install "lantern"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/DhyaanKanoja11/Lantern/releases/download/v0.2.3/lantern_0.2.3_linux_arm64.tar.gz"
      sha256 "e17d2acc1a0efdf6969d8cc62b6dafdb504c865c8f874dae1a98a795afa22a06"

      def install
        bin.install "lantern"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/DhyaanKanoja11/Lantern/releases/download/v0.2.3/lantern_0.2.3_linux_amd64.tar.gz"
      sha256 "d125baa7dc96f45f974346cff575e93b06f4bfc29c60005e19122a0a64650252"

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

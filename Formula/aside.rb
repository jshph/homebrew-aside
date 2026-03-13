class Aside < Formula
  desc "Record mic + system audio side-by-side with a memo, then distill into structured notes"
  homepage "https://github.com/jshph/aside"
  url "https://github.com/jshph/aside/releases/download/v0.2.1/aside-0.2.1-aarch64-apple-darwin.tar.gz"
  sha256 "a7504faa680511035bcfc5489f0b8fda6af8e7b654e9b0f84a0d8f30e29edc66"
  license "Apache-2.0"

  depends_on :macos

  def install
    bin.install "aside"
    prefix.install "install.sh"
  end

  def caveats
    <<~EOS
      aside requires:

      1. Screen & System Audio Recording permission for your terminal app.
         Grant in: System Settings > Privacy & Security > Screen & System Audio Recording
         Or run: bash #{prefix}/install.sh

      2. whisper-cpp for transcription:
         brew install whisper-cpp

      3. ffmpeg for audio conversion:
         brew install ffmpeg
    EOS
  end

  test do
    assert_match "aside", shell_output("#{bin}/aside --help")
  end
end

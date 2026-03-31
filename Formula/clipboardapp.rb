class Clipboardapp < Formula
  desc "Simple clipboard manager for macOS"
  homepage "https://github.com/ay01231/ClipboardApp"
  url "https://github.com/ay01231/ClipboardApp/releases/download/v1.0.0/Clipboard.app.zip"
  sha256 "de850730a4367d08f6c95b4864b94933d726953781100d38f8f0acdf665d2026"
  version "1.0.0"

  def install
    prefix.install "Clipboard.app"
    bin.write_exec_script "#{prefix}/Clipboard.app/Contents/MacOS/Clipboard"
  end

  def caveats
    <<~EOS
      ⚠️ Grant Accessibility permission:
      System Settings → Privacy & Security → Accessibility
    EOS
  end
end
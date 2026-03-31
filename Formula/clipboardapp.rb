class Clipboardapp < Formula
  desc "Simple clipboard manager for macOS"
  homepage "https://github.com/ay01231/ClipboardApp"
  url "https://github.com/ay01231/ClipboardApp/releases/download/v1.0.0/Clipboard.app.zip"
  sha256 "84069555f5c0596af7527120d01ccf26f2e30fdc3359db6b10318e0464ec6046"
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
class Clipboardapp < Formula
  desc "Simple clipboard manager for macOS"
  homepage "https://github.com/ay01231/ClipboardApp"
  url "https://github.com/ay01231/ClipboardApp/releases/download/v1.0.0/Clipboard.app.zip"
  sha256 "ca95f93f4e2aa32a54dd9e44e8fffea420199d7019c1e3935e926fbaa8df583e"
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
# ClipboardApp

Simple and lightweight clipboard manager for macOS.

ClipboardApp helps you quickly access and reuse your clipboard history using a clean popup interface and keyboard shortcuts.

---

## ✨ Features

* 📋 Clipboard history tracking
* ⚡ Fast popup with hotkey (`Cmd + Shift + V`)
* ⌨️ Navigate with keyboard (↑ ↓)
* ↩️ Press Enter to paste instantly
* 🪶 Lightweight & minimal

---

## 🚀 Installation

### Option 1 — Install via Homebrew (Recommended)

```bash
brew tap ay01231/clipboardapp
brew install --cask clipboardapp
```

---

### Option 2 — Direct install via URL

```bash
brew install --cask https://github.com/ay01231/ClipboardApp/releases/latest/download/ClipboardApp.zip
```

---

### Option 3 — Manual install

1. Download the latest release from:
   https://github.com/ay01231/ClipboardApp/releases

2. Extract the zip file

3. Move the app to Applications:

```bash
mv ClipboardApp.app /Applications/
```

4. Open the app:

```bash
open /Applications/ClipboardApp.app
```

---

## ⌨️ Usage

| Action         | Shortcut          |
| -------------- | ----------------- |
| Open Clipboard | `Cmd + Shift + V` |
| Navigate items | `↑ / ↓`           |
| Paste selected | `Enter`           |
| Close Popup    | `Esc `            |


---

## ⚠️ First Run (Important)

If macOS blocks the app:

```bash
xattr -rd com.apple.quarantine /Applications/ClipboardApp.app
```

---

## 🔧 Requirements

* macOS
* Swift
* Homebrew (for installation)

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 👤 Author

Created by [@ay01231](https://github.com/ay01231)

---

Clipboard Setup Guide

IMPORTANT: Enable Accessibility Permissions

For keyboard shortcut (Cmd+Shift+V) to work, you MUST grant ClipboardPro accessibility permissions:

STEP 1: Open System Settings
- Click Apple menu → System Settings

STEP 2: Navigate to Privacy & Security
- Left sidebar → Privacy & Security

STEP 3: Enable Accessibility
- Find "Accessibility" in the list
- Click on it
- Click the "+" button
- Navigate to: ./Clipboardapp/
- Select "Clipboard.app"

- Navigate to: /Users/YOUR_USERNAME/Clipboardapp/
- Select "Clipboard.app"
- Click "Open"
- If prompted, enter your password

STEP 4: Check "Input Monitoring" (macOS 12+)
- Still in Privacy & Security
- Find "Input Monitoring" 
- Add Clipboard.app the same way

STEP 5: Restart the app
- Close Clipboard completely
- Add Clipboard.app the same way

STEP 5: Restart the app
- Close ClipboardPro completely
- Reopen it from Terminal or Finder

STEP 6: Test
- Copy some text (Cmd+C in any app)
- Click in a text field in another app
- Press Cmd+Shift+V
- Watch terminal for debug output
- If you see "Cmd+Shift+V detected!", keyboard monitoring is working

ALTERNATIVE: Use Menu Bar Button

While you set up permissions, you can use the menu bar:
1. App is running (icon in menu bar: 📋)
2. Click the icon
3. Select "Open Clipboard"
4. Paste selected item using Space/Enter

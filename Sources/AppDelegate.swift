import Cocoa

final class AppDelegate: NSObject, NSApplicationDelegate {

    private var popup: PopupWindow?
    private var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ notification: Notification) {

        ClipboardStore.shared.startMonitoring()

        setupMenuBar()
        setupHotkey()
    }

    func applicationWillTerminate(_ notification: Notification) {
        ClipboardStore.shared.clearSessionHistory()
    }

    private func setupMenuBar() {

        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem.button?.title = "📋"

        let menu = NSMenu()

        menu.addItem(
            withTitle: "Open Clipboard",
            action: #selector(showPopup),
            keyEquivalent: "v"
        )

        menu.addItem(.separator())

        menu.addItem(
            withTitle: "Quit",
            action: #selector(quit),
            keyEquivalent: "q"
        )

        statusItem.menu = menu
    }

    private func setupHotkey() {

        HotkeyManager.shared.register { [weak self] in
            self?.showPopup()
        }
    }

    @objc
    private func showPopup() {
    
        if popup == nil {
            popup = PopupWindow()
        }
    
        popup?.reload()
    
        NSApp.setActivationPolicy(.regular)
        NSApp.activate(ignoringOtherApps: true)
    
        guard let window = popup?.window else { return }
    
        window.level = .floating
        window.center()
        window.makeKeyAndOrderFront(nil)
    
        DispatchQueue.main.async {
            window.makeFirstResponder(self.popup?.table)
        }
    }

    @objc
    private func quit() {
        NSApp.terminate(nil)
    }
}
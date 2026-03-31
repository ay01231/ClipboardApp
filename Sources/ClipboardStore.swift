import Cocoa

final class ClipboardStore {

    static let shared = ClipboardStore()

    struct ClipboardItem {
        let text: String?
        let image: NSImage?
    }

    private let pasteboard = NSPasteboard.general
    private var changeCount = NSPasteboard.general.changeCount

    private(set) var history: [ClipboardItem] = []

    func startMonitoring() {

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.checkClipboard()
        }
    }

    private func checkClipboard() {

        guard pasteboard.changeCount != changeCount else { return }
        changeCount = pasteboard.changeCount

        if let image = NSImage(pasteboard: pasteboard) {
            history.insert(.init(text: nil, image: image), at: 0)
        }
        else if let text = pasteboard.string(forType: .string) {
            history.insert(.init(text: text, image: nil), at: 0)
        }

        history = Array(history.prefix(100))
    }

    func clearSessionHistory() {
        history.removeAll()
    }
}
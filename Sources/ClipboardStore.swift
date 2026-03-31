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

    private var isInternalChange = false

    func startMonitoring() {

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.checkClipboard()
        }
    }

    private func checkClipboard() {

        guard pasteboard.changeCount != changeCount else { return }
        changeCount = pasteboard.changeCount

        if isInternalChange {
            isInternalChange = false
            return
        }

        var newItem: ClipboardItem?

        if let image = NSImage(pasteboard: pasteboard) {
            newItem = .init(text: nil, image: image)
        }
        else if let text = pasteboard.string(forType: .string) {
            newItem = .init(text: text, image: nil)
        }

        guard let item = newItem else { return }

        if let first = history.first {

            if let t1 = first.text, let t2 = item.text, t1 == t2 {
                return
            }

            if let i1 = first.image, let i2 = item.image,
               i1.tiffRepresentation == i2.tiffRepresentation {
                return
            }
        }

        history.insert(item, at: 0)
        history = Array(history.prefix(100))
    }

    func clearSessionHistory() {
        history.removeAll()
    }

    func markInternalChange() {
        isInternalChange = true
    }
}
import Cocoa

final class ClipboardTableView: NSTableView {

    var onSelect: (() -> Void)?

    override var acceptsFirstResponder: Bool { true }
    override func viewDidMoveToWindow() {
    super.viewDidMoveToWindow()
    window?.makeFirstResponder(self)
}

    override func keyDown(with event: NSEvent) {

    switch event.keyCode {

    case 36, 76:

        if selectedRow < 0 && numberOfRows > 0 {
            selectRowIndexes(IndexSet(integer: 0), byExtendingSelection: false)
        }

        onSelect?()
        return

    case 53:
        window?.close()
        return

    default:
        super.keyDown(with: event)
    }
    }
}
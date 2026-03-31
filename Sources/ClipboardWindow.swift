import Cocoa

final class ClipboardWindow: NSWindow {

    override var canBecomeKey: Bool { true }
    override var canBecomeMain: Bool { true }
    override var acceptsFirstResponder: Bool { true }
    override func keyDown(with event: NSEvent) {

    switch event.keyCode {

    case 36, 76:
        if let controller = windowController as? PopupWindow {
            controller.performEnterAction()
            return
        }

    default:
        break
    }

    super.keyDown(with: event)
}
}
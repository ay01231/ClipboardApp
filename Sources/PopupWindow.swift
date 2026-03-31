import Cocoa

final class PopupWindow: NSWindowController, NSTableViewDelegate, NSTableViewDataSource {

    let table = ClipboardTableView()
    private var data: [ClipboardStore.ClipboardItem] = []

    convenience init() {

        let window = ClipboardWindow(
            contentRect: NSRect(x: 0, y: 0, width: 650, height: 420),
            styleMask: [.titled, .closable],
            backing: .buffered,
            defer: false
        )

        self.init(window: window)
        window.center()
        setup()
    }

    private func setup() {

        let scroll = NSScrollView(frame: window!.contentView!.bounds)
        scroll.autoresizingMask = [.width, .height]

        let column = NSTableColumn(identifier: .init("Clipboard"))
        column.width = 600

        table.addTableColumn(column)
        table.delegate = self
        table.dataSource = self

        table.onSelect = { [weak self] in
            self?.selectItem()
        }

        scroll.documentView = table
        window?.contentView?.addSubview(scroll)
    }

    func reload() {

        data = ClipboardStore.shared.history
        table.reloadData()

        if !data.isEmpty {
            table.selectRowIndexes(IndexSet(integer: 0), byExtendingSelection: false)
        }

        window?.makeFirstResponder(table)
    }

@objc
private func selectItem() {

    let row = table.selectedRow
    guard row >= 0 else { return }
    let item = data[row]
    let pb = NSPasteboard.general
    ClipboardStore.shared.markInternalChange()
    pb.clearContents()

    if let text = item.text {
        pb.setString(text, forType: .string)
    } else if let image = item.image {
        pb.writeObjects([image])
    }

    window?.orderOut(nil)
    NSApp.hide(nil)

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        ClipboardService.shared.simulatePaste()
    }
}

    func numberOfRows(in tableView: NSTableView) -> Int {
        data.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

        let item = data[row]

        if let text = item.text {
            return NSTextField(labelWithString: text)
        }

        if let image = item.image {
            let view = NSImageView()
            view.image = image
            view.frame = NSRect(x: 0, y: 0, width: 50, height: 50)
            return view
        }

        return nil
    }
}
import Cocoa
import Carbon

final class HotkeyManager {

    static let shared = HotkeyManager()

    private var hotKeyRef: EventHotKeyRef?
    private var handler: (() -> Void)?

    func register(handler: @escaping () -> Void) {

        self.handler = handler

        let hotKeyID = EventHotKeyID(
            signature: OSType(UInt32(truncatingIfNeeded: "CLIP".hashValue)),
            id: 1
        )

        let modifiers: UInt32 = UInt32(cmdKey | shiftKey)
        let keyCode: UInt32 = UInt32(kVK_ANSI_V)

        let status = RegisterEventHotKey(
            keyCode,
            modifiers,
            hotKeyID,
            GetApplicationEventTarget(),
            0,
            &hotKeyRef
        )

        if status != noErr {
            print("Failed to register hotkey")
        }

        var eventType = EventTypeSpec(
            eventClass: OSType(kEventClassKeyboard),
            eventKind: UInt32(kEventHotKeyPressed)
        )

        InstallEventHandler(
            GetApplicationEventTarget(),
            { (_, _, userData) -> OSStatus in

                if let userData = userData {

                    let manager = Unmanaged<HotkeyManager>
                        .fromOpaque(userData)
                        .takeUnretainedValue()

                    DispatchQueue.main.async {
                        manager.handler?()
                    }
                }

                return noErr
            },
            1,
            &eventType,
            UnsafeMutableRawPointer(Unmanaged.passUnretained(self).toOpaque()),
            nil
        )

        print("Hotkey registered (Carbon)")
    }
}
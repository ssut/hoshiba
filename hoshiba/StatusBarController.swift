import Cocoa
import SwiftUI

class StatusBarController: ObservableObject {
    private var statusBar: NSStatusBar
    private var statusItem: NSStatusItem?
    private var popover: NSPopover
    
    init() {
        statusBar = NSStatusBar.system
        popover = NSPopover()
    }
    
    func setup() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.createStatusBarItem()
        }
    }
    
    private func createStatusBarItem() {
        statusItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)
        guard let statusItem = statusItem else {
            print("Failed to create status item.")
            return
        }
        if let button = statusItem.button {
            button.title = "Wi2 Bypass"
            button.action = #selector(togglePopover(_:))
            button.target = self
        }
        
        let contentView = ContentView()
            .environmentObject(self)
            .environmentObject(MainController.shared)
        
        popover.contentViewController = NSHostingController(rootView: contentView)
        popover.behavior = .transient
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        if popover.isShown {
            popover.performClose(sender)
        } else {
            if let button = statusItem?.button {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            }
        }
    }
}

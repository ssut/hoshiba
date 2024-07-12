import Cocoa
import SwiftUI

@main
struct hoshibaApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            EmptyView() // Ensure no main window is created
        }
    }
}


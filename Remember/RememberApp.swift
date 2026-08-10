import SwiftUI

@main
struct RememberApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .frame(minWidth: 1000, minHeight: 700)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .defaultSize(width: 1440, height: 900)
        .windowResizability(.contentMinSize)
    }
}

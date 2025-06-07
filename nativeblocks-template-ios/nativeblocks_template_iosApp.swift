import SwiftUI

@main
struct nativeblocks_template_iosApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        initNativeblocks()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) {
            if scenePhase == .background {
                destroyNativeblocks()
            }
        }
    }
}

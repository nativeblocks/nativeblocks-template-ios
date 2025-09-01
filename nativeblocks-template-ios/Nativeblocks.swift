import Foundation
import Nativeblocks
import NativeblocksFoundation
import NativeblocksWandKit
import SwiftUI

func initNativeblocks() {
    _ = NativeblocksManager.initialize(
        edition: .cloud(
            endpoint: "https://api.nativeblocks.io/gateway/init",
            apiKey: "API_KEY",
            developmentMode: true
        )
    )
    NativeblocksFoundationProvider.provide()
    
    /* to enable hot-reload and get live update in debug mode */
    #if DEBUG
    _ = NativeblocksManager.getInstance().wandKit(LiveKit())
    #endif
    
    /* if you need localization
     _ = NativeblocksManager.getInstance().setLocalization(languageCode: "EN")
    */
    
    _ = NativeblocksManager.getInstance().provideFallbackBlock { keyType, key in
        // custom fallback view when there is no block found
        return Text("No block found for \(keyType)")
    }
    
    _ = NativeblocksManager.getInstance().provideFallbackAction { keyType, name in
        // custom fallback action when thre is no action found
        print("No action found for \(keyType)")
    }
    
    _ = NativeblocksManager.getInstance().provideEventLogger(loggerType: "AppLogger", logger: AppLogger())
    
}

func destroyNativeblocks() {
    NativeblocksManager.getInstance().destroy()
}

class AppLogger: INativeLogger {
    func log(eventName: String, parameters: [String : String]) {
        print(eventName + "log: \(parameters)")
    }
}

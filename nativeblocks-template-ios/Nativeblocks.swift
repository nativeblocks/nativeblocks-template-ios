import Foundation
import Nativeblocks
import NativeblocksFoundation
import NativeblocksWandKit

func initNativeblocks() {
    NativeblocksManager.initialize(
        edition: .cloud(
            endpoint: "https://api.nativeblocks.io/gateway/init",
            apiKey: "API_KEY",
            developmentMode: true
        )
    )
    NativeblocksFoundationProvider.provide()
    
    #if DEBUG
    _ = NativeblocksManager.getInstance().wandKit(LiveKit())
    #endif
    
    NativeblocksManager.getInstance().provideEventLogger(loggerType: "AppLogger", logger: AppLogger())
    
}

func destroyNativeblocks() {
    NativeblocksManager.getInstance().destroy()
}


class AppLogger: INativeLogger {
    func log(eventName: String, parameters: [String : String]) {
        print(eventName + "log: \(parameters)")
    }
}

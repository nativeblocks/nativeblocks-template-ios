import SwiftUI
import Nativeblocks

struct ContentView: View {
    var body: some View {
        NativeblocksFrame(
            route: "/",
            routeArguments: [:],
            loading: {
                AnyView(NativeblocksLoading())
            },
            error: { message in
                AnyView(NativeblocksError(message: message))
            }
        )
    }
}

#Preview {
    ContentView()
}

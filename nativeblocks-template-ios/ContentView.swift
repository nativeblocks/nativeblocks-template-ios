import SwiftUI
import Nativeblocks

struct ContentView: View {
    var body: some View {
        NativeblocksFrame(
            route: "/welcome",
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

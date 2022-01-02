import TokamakShim

struct Counter2: View {

    @State var count: Int

    let limit: Int

    var body: some View {
        if count < limit {
            VStack {
                Button("Increment !") { count += 1 }
                Text("\(count)")
            }
            .onAppear { print("Counter.VStack onAppear") }
            .onDisappear { print("Counter.VStack onDisappear") }
        } else {
            VStack { Text("Limit exceeded") }
        }
    }
}

struct CounterApp: App {
    var body: some Scene {
        WindowGroup("Counter Demo") {
            Counter2(count: 5, limit: 20)
        }
    }
}

// @main attribute is not supported in SwiftPM apps.
// See https://bugs.swift.org/browse/SR-12683 for more details.
CounterApp.main()

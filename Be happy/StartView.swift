import SwiftUI

struct StartView: View {
    @State private var isScreenRecording = false
    @State private var showFirstView = true

    var body: some View {
        VStack {
            if showFirstView {
                WelcomeView(isScreenRecording: $isScreenRecording)
                    .opacity(isScreenRecording ? 0 : 1)
                    .onAppear {
                        detectScreenRecording { isRecording in
                            self.isScreenRecording = isRecording
                        }

                        // Simulate a delay to transition to the next view
                        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                            withAnimation {
                                self.showFirstView = false
                            }
                        }
                    }
            } else {
                RegisterView()
            }
        }
        .padding()
    }

    func detectScreenRecording(action: @escaping (Bool) -> ()) {
        let mainQueue = OperationQueue.main
        NotificationCenter.default.addObserver(forName: UIScreen.capturedDidChangeNotification, object: nil, queue: mainQueue) { notification in
            action(UIScreen.main.isCaptured)
        }
    }
}

struct WelcomeView: View {
    @Binding var isScreenRecording: Bool

    var body: some View {
        Text("Welcome View")
            .opacity(isScreenRecording ? 0.5 : 1)
    }
}

struct RegisterView: View {
    var body: some View {
        Text("Register View")
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

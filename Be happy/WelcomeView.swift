import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    class Coordinator: NSObject {
        var parent: VideoPlayerView

        init(parent: VideoPlayerView) {
            self.parent = parent
        }

        @objc func playerItemDidReachEnd(_ notification: Notification) {
            if let player = notification.object as? AVPlayer {
                player.seek(to: .zero)
                player.play()
            }
        }
    }

    let videoURL: URL

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player

        NotificationCenter.default.addObserver(
            context.coordinator,
            selector: #selector(Coordinator.playerItemDidReachEnd(_:)),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem
        )

        player.play()

        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

struct WelcomeView: View {
    var body: some View {
        if let videoURL = Bundle.main.url(forResource: "kandinsky-video-1703254943349", withExtension: "mp4") {
            VideoPlayerView(videoURL: videoURL)
                .edgesIgnoringSafeArea(.all)
                .disabled(true)
        } else {
            Text("Видео не найдено")
        }
    }
}

struct PresentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

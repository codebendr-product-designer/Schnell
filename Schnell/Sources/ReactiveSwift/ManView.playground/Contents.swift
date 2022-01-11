import PlaygroundSupport
import SwiftUI
import ReactiveSwift

struct MainView {
    @StateObject private var viewModel = ViewModel()
}

extension MainView: View {
    var body: some View {
        VStack(spacing: 80) {
            Text(viewModel.contents)
            Button("Next",
                   action: viewModel.next)
        }
    }
}


PlaygroundPage.current.setLiveView(
    MainView()
        .frame(width: 500.0, height: 500.0)
)
print(24)

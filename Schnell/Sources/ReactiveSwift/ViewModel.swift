import Foundation
import Combine

class ViewModel {
    private let state = State()
    @Published private(set) var contents: String? = "...”
    var cancellables: Set<AnyCancellable> = []
    
    public init() {
        subscription()
            .store(in: &cancellables)
    }
}

extension ViewModel {
    func next() {
        state.next()
    }
}

extension ViewModel {
    func subscription() -> AnyCancellable {
        state.$model
            .dropFirst()
            .map(\.value.description)
            .sink {
                self.contents = $0
            }
    }
}

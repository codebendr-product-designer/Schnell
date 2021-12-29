import Foundation
import Combine

public class ViewModel {
    private let state = State()
    @Published public private(set) var contents: String? = "..."
    var cancellables: Set<AnyCancellable> = []
    
    public init() {
        subscription()
            .store(in: &cancellables)
    }
}

public extension ViewModel {
    func next() {
        state.next()
    }
}

public extension ViewModel {
    func subscription() -> AnyCancellable {
        state.$model
            .dropFirst()
            .map(\.value.description)
            .sink {
                self.contents = $0
            }
    }
}

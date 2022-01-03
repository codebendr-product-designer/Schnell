import Combine
import Foundation

public class ViewModel {
    private let state = State()
    @Published public private(set) var contents: String = "..."
//    var cancellables: Set<AnyCancellable> = []

    public init() {
        subscription()
    }
}

public extension ViewModel {
    func next() { state.next() }
}

public extension ViewModel {
    func subscription() {
        state
            .subject
            .map{[state] _ in state.value}
            .assignDescription(to: &$contents)
    }
}

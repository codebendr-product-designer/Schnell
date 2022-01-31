import Combine
import Foundation

public class ViewModel: ObservableObject {
    private let state = State()
    @Published public private(set) var contents: String = "2"

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
            .$value
            .dropFirst()
            .assignDescription(to: &$contents)
    }
}

public extension ViewModel {
    func sequence() {
    }
}

import Combine
import Foundation

public class ViewModel: ObservableObject {
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
            .$value
            .dropFirst()
            .assignDescription(to: &$contents)
    }
}

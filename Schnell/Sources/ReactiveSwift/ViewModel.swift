import Foundation
import Combine

public class ViewModel {
    private let state = State()
    @Published public private(set) var contents: String? = "..."
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
        state.$model
            .dropFirst()
            .map(\.value.description)
            .descriptionAsOptional()
//            .sink { self.contents = $0 }
            .assign(to: &$contents)
    }
}

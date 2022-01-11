import Combine
import Foundation

public class State {
    @Published private var model = Model()
    public private(set) lazy var valuePublisher: AnyPublisher<Int, Never> = $model
        .dropFirst()
        .map(\.value)
        .eraseToAnyPublisher()

    public init() {}
}

public extension State {
    func next() {
        model = model.next
    }
}

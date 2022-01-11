import Combine
import Foundation

public class State {
    @Published private var model = Model()
    @Published public private(set) var value = 0
    public init() {}
}

public extension State {
    func next() {
        model = model.next
    }
}

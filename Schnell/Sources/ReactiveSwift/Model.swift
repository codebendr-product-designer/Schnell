import Combine
import Foundation

public struct Model {
    public let value: Int
    var next: Self { .init(.random(in: 1 ... 100)) }

    init() { value = 0 }

    private init(_ value: Int) {
        self.value = value
    }
}

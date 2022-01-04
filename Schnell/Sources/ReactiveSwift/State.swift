import Foundation
import Combine

public class State: ObservableObject {
    @Published private var model = Model()
    
    public init() {}
}

public extension State {
    
    public var value: Int { model.value }
    
    func next() {
        model = model.next
    }
}

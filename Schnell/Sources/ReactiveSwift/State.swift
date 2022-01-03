import Foundation
import Combine

public class State {
    private var model = Model() {
        didSet {
            subject.send()
        }
    }
    public let subject = PassthroughSubject<Void, Never>()
    
    public init() {}
}

public extension State {
    
    public var value: Int { model.value }
    
    func next() {
        model = model.next
    }
}

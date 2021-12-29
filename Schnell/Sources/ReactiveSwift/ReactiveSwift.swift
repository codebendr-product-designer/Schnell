import Foundation
import Combine

public class Model {
    @Published public private(set) var value = 0
    private var seconds = 10
    
    public init(){}
    
    public init(value: Int) {
        self.value = value
    }
}

extension Model {
    public func next() {
        Timer.every(1.seconds) { [unowned self] in
            self.seconds -= 1
            value += 2
            if seconds == 0 {
                $0.invalidate()
            }
        }
    }
}

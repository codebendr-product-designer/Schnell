import Combine
import Foundation

// public class Model {
//    @Published public private(set) var value = 0
//    private var seconds = 10
//
//    public init(){}
//
//    public init(value: Int) {
//        self.value = value
//    }
// }
//
// extension Model {
//    public func next() {
//        Timer.every(1.seconds) { [unowned self] in
//            self.seconds -= 1
//            value += 2
//            if seconds == 0 {
//                $0.invalidate()
//            }
//        }
//    }
// }

public struct Model {
    public let value: Int

    init() { value = 0 }
}

extension Model {
    private init(
        _ value: Int
    ) {
        self.value = value
    }
    
    var next: Self { .init(.random(in: 1...100)) }
}

public class State {
  @Published public private(set) var model = Model()
  public init() {}
}

extension State {
  public func next() {
    model = model.next
  }
}

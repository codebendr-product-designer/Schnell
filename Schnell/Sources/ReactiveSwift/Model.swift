import Combine
import Foundation

struct Model {
    let value: Int
    

    init() { value = 0 }

   
}

extension Model {
    private init(_ value: Int) {
        self.value = value
    }
    
    var next: Self { .init(.random(in: 1 ... 100)) }
}

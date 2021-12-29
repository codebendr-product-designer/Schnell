import Foundation
import Combine

public class Model {
    @Published private(set) var value = 0
    
    public init(){}
    
    public init(value: Int) {
        self.value = value
    }
}

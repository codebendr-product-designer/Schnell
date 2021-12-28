import Foundation
import Swim

struct Write: BuiltinRule, Rule {
    var contents: Node
    var to: String // relative path
    
    func run() {
        print("\(contents) — filename: \(to)")
    }
}

extension Never: Rule {
    var body: Never {
        fatalError()
    }
}


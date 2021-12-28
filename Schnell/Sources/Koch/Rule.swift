import Foundation

protocol Rule {
    associatedtype Body: Rule
    var body: Body { get }
}

extension Rule {
    func execute() {
        AnyBuiltinRule(self).run()
    }
}

protocol BuiltinRule {
    func run()
}

extension BuiltinRule {
    var body: Never {
        fatalError()
    }
}

struct AnyBuiltinRule: BuiltinRule {
    let _run: () -> ()
    init<R: Rule>(_ rule: R) {
        if let builtin = rule as? BuiltinRule {
            self._run = builtin.run
        } else {
            self._run = { AnyBuiltinRule(rule.body).run() }
        }
    }
    
    func run() {
        _run()
    }
}

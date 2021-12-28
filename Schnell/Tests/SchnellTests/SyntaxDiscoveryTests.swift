import XCTest
import Foundation
import Schnell

final class SyntaxDiscoveryTests: XCTestCase {
    
    struct Person {
        let name: String
        
        mutating func rename(to newName: String) {
            self = .init(name: newName)
        }
    }
    
    var person = Person(name: "John")
    
    func test_nameIsJohn() {
        XCTAssertEqual(person.name, "John")
    }
    
    func test_nameIsLuka() {
        person.rename(to: "Luka")
        XCTAssertEqual(person.name, "Luka")
    }
    
    //optional dictionary text
    var dict: [String: Int?] = [
        "one": 1,
        "two": 2
    ]

    func test_dictionaryWithNilItem() {
        dict["two"] = nil
        XCTAssertEqual(dict, ["one": Optional(1)])
    }
    
    func test_dictionaryRemoveAnItemBySettingToNil() {
        dict["two"] = .some(nil)
        XCTAssertEqual(dict, ["one": Optional(1), "two": nil])
    }
    
}

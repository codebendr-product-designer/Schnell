import XCTest
import class Foundation.Bundle
import Schnell

final class MultiParadigmTests: XCTestCase {
    let numbers  = [1, 2, 4, 10, -1, 2, -10]
    
    func test_imperativeNumberCal() {
        example("imperative") {
            var total = 0
            for value in numbers {
                total += value
            }
            XCTAssertEqual(total, 8)
        }
    }
    
    func test_functionalNumberCal_using_reduce() {
        example("functional") {
            XCTAssertEqual(numbers.reduce(0,+), 8)
        }
    }
    
    func test_functionalNumberCal_using_reduceWithEarlyExit() {
        example("functional, early-exit") {
            let total = numbers.reduce((accumulating: true, total: 0))
            { (state, value) in
                if state.accumulating && value >= 0 {
                    return (accumulating: true, state.total + value)
                }
                else {
                    return (accumulating: false, state.total)
                }
            }.total
            XCTAssertEqual(total, 17)
        }
    }
    
    func test_imperativeNumberCalWithEarlyExit() {
        example("imperative, early-exit") {
            var total = 0
            for value in numbers {
                guard value >= 0 else { break }
                total += value
            }
            XCTAssertEqual(total, 17)
        }
    }
    
    func test_imperativeNumberCalWithEarlyExitImmutability() {
        example("imperative, early-exit with just-in-time mutability") {
          let total: Int = {
            var total = 0
            for value in numbers {
              guard value >= 0 else { break }
              total += value
            }
            return total
          }()
            XCTAssertEqual(total, 17)
        }
    }
    
}

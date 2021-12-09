import Foundation
import XCTest

public extension XCTestCase {
    func example(_ title: String, code: () throws -> Void) rethrows {
        print("## \(title)")
        try code()
        print("---")
    }
}

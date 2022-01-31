import UIKit

let shot1 = CGPoint(x: 10, y: 0)
let shot2 = CGPoint(x: 4, y: 7)
let shot3 = CGPoint(x: -1, y: -1)

extension CGPoint {
    public static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}

let totalDistance = shot1 + shot2 + shot3

let apple = URL(string: "http://www.apple.com")!
let mac = apple.appendingPathComponent("mac")

extension URL {
    static func +(lhs: URL, rhs: String) -> URL {
        lhs.appendingPathComponent(rhs)
    }
}

let watch = apple + "watch"

extension URL {
    static func +=(lhs: inout URL, rhs: String) {
        lhs.appendPathComponent(rhs)
    }
}

extension CGSize {
    static func +(lhs: CGSize, rhs: CGSize) -> CGSize {
        CGSize(width: lhs.width + rhs.width, height: rhs.width + rhs.height)
    }
}

let textSize = CGSize(width: 100, height: 20)
let shadowSize = CGSize(width: 10, height: 10)
let totalSize = textSize + shadowSize

extension URL {
    static func / (lhs: URL, rhs: String) -> URL {
        lhs.appendingPathComponent(rhs)
    }
}

let youtube = URL(string: "https://www.youtube.com/")!

youtube/"watch"/"?app=desktop&v=TLmBeqA53bo"

infix operator **

extension Double {
    static func **(lhs: Double, rhs: Double) -> Double {
        pow(lhs, rhs)
    }
}

print(2.0 ** 8.0)

import Combine
import Foundation
import PlaygroundSupport
import ReactiveSwift
import UIKit

var state = State()

var seconds = 10
Timer.every(1.second) {
    seconds -= 1
    state.next()
    if seconds == 0 {
        $0.invalidate()
    }
}


// PlaygroundPage.current.liveView = print("something something")

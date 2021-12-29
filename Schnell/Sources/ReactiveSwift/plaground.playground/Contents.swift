import Combine
import Foundation
import PlaygroundSupport
import ReactiveSwift
import UIKit

var state = State()
var cancellables: Set<AnyCancellable> = []

var _seconds = 10
Timer.every(1.seconds) {
    _seconds -= 1
    state.next()
    if _seconds == 0 {
        $0.invalidate()
    }
}

func subscription() -> AnyCancellable {
    state.$model
        .dropFirst()
        .map(\.value.description)
        .sink {
            print("number " + $0)
        }
}

subscription()
    .store(in: &cancellables)

// PlaygroundPage.current.liveView = print("something something")

import Foundation
import PlaygroundSupport
import UIKit
import Combine
import ReactiveSwift

var seconds = 10


var model = Model()
var cancellables: Set<AnyCancellable> = []
Timer.every(1.seconds) {
    seconds -= 1
    model.value += 2
    if seconds == 0 {
        $0.invalidate()
    }
}

model.$value
    .dropFirst()
    .map(\.description)
    .sink {
    print("number "+$0)
}
.store(in: &cancellables)




// PlaygroundPage.current.liveView = print("something something")

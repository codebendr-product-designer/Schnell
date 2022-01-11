import Combine
import Foundation
import PlaygroundSupport
import ReactiveSwift
import UIKit

var viewModel = ViewModel()


var seconds = 10
Timer.every(1.0.second) {
    seconds -= 1
    viewModel.next()
    viewModel
        .$contents
        .sink {
        print($0)
    }
    if seconds == 0 {
        $0.invalidate()
    }
}

// PlaygroundPage.current.liveView = print("something something")

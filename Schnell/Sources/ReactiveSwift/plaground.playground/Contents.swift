import Foundation
import PlaygroundSupport
import UIKit
import Combine
import ReactiveSwift

var model = Model()
var cancellables: Set<AnyCancellable> = []
model.next()

func subscription() -> AnyCancellable {
model.$value
    .dropFirst()
    .map(\.description)
    .sink {
    print("number "+$0)
   }
}
   
subscription()
    .store(in: &cancellables)

// PlaygroundPage.current.liveView = print("something something")

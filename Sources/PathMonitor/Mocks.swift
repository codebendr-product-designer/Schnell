import Network
import Foundation
import Combine

public extension PathMonitor {
    static let satisfied = Self(
        publisher: Just(.init(status: .satisfied))
            .eraseToAnyPublisher()
    )
    
    static let unsatisfied = Self(
        publisher: Just(.init(status: .unsatisfied))
            .eraseToAnyPublisher()
    )
    
    static let flakey = Self(
        publisher: Timer.publish(every: 2, on: .main, in: .default)
            .autoconnect()
            .scan(.satisfied, { status, _ in
                status == .satisfied ? .unsatisfied : .satisfied
            })
            .map{ NetworkPath(status: $0) }
            .eraseToAnyPublisher()
    )
    
    static func delayed(for every: TimeInterval = 10) -> Self {
        .init(
            publisher: Timer.publish(every: every, on: .main, in: .default)
                .autoconnect()
                .scan(.unsatisfied, { status, _ in .satisfied })
                .map{ NetworkPath(status: $0) }
                .eraseToAnyPublisher()
        )
    }
}


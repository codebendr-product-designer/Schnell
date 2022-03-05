import Network
import Foundation

public extension PathMonitor {
    static let satisfied = Self(
        setPathUpdateHandler: { callback in
            callback(NetworkPath(status: .satisfied))
        }
    )
}

public extension PathMonitor {
    static let unsatisfied = Self(
        setPathUpdateHandler: { callback in
            callback(NetworkPath(status: .unsatisfied))
        }
    )
}

public extension PathMonitor {
    static let flakey = Self(
        setPathUpdateHandler: { callback in
            var status = NWPath.Status.satisfied
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                callback(NetworkPath(status: status))
                status = status == .satisfied ? .unsatisfied : .satisfied
            }
        }
    )
}

public extension PathMonitor {
    static func delayed(_ withTimeInterval: TimeInterval = 10) -> Self {
        .init(
            setPathUpdateHandler: { callback in
                var status = NWPath.Status.unsatisfied
                
                Timer.scheduledTimer(withTimeInterval: withTimeInterval, repeats: false) { _ in
                    status = .satisfied
                    callback(NetworkPath(status: status))
                    
                }
            }
        )
    }
}


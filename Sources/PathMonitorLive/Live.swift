import Network
import Foundation
import PathMonitor

public extension PathMonitor {
    static var live: Self {
        let monitor = NWPathMonitor()
        return .init(
            setPathUpdateHandler: { callback in
                monitor.pathUpdateHandler = { path in
                    callback(.init(rawValue: path))
                }
            },
            start: monitor.start,
            cancel: { monitor.cancel() }
        )
    }
}

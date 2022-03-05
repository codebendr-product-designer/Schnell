import Network
import Foundation
import PathMonitor
import Combine

public extension PathMonitor {
    static func live(queue: DispatchQueue = .main) -> Self {
        let monitor = NWPathMonitor()
        let subject = PassthroughSubject<NWPath, Never>()
        monitor.pathUpdateHandler = subject.send
        
        return .init(publisher:subject
                        .handleEvents(
                            receiveSubscription: { _ in monitor.start(queue: queue) },
                            receiveCancel: monitor.cancel
                        )
                        .map(NetworkPath.init(rawValue:))
                        .eraseToAnyPublisher()
        )
    }
}

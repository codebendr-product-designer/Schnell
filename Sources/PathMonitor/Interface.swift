import Network
import Combine

public struct NetworkPath {
    public var status: NWPath.Status
    
    public init(status: NWPath.Status) {
        self.status = status
    }
}

public extension NetworkPath {
    init(rawValue: NWPath) {
        self.status = rawValue.status
    }
}

public struct PathMonitor {
   public var publisher: AnyPublisher<NetworkPath, Never>
    
   public init(publisher: AnyPublisher<NetworkPath, Never>) {
        self.publisher = publisher
    }
}

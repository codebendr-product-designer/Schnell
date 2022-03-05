import Network

public struct NetworkPath {
    public var status: NWPath.Status
}

public extension NetworkPath {
    init(rawValue: NWPath) {
        self.status = rawValue.status
    }
}

public struct PathMonitor {
    public var setPathUpdateHandler: (@escaping (NetworkPath) -> Void) -> Void
    public var start: (DispatchQueue) -> Void = { _ in }
    public var cancel: () -> Void = { }
    
    public init(setPathUpdateHandler: @escaping (@escaping (NetworkPath) -> Void) -> Void, start: @escaping (DispatchQueue) -> Void = { _ in }, cancel: @escaping () -> Void = { }) {
        self.setPathUpdateHandler = setPathUpdateHandler
        self.start = start
        self.cancel = cancel
    }
}

import Combine

extension Publisher where Output == CustomStringConvertible {
    public typealias Map = Publishers.Map<Self, String>
    public func description() -> Map { map(\.description) }
    
    public func descriptionAsOptional() -> Publishers.Map<Self, String?> {
        map{.some($0.description)}
      }
}

/*
 extension Publisher where Output == CustomModel {
     public typealias Map = Publishers.Map<Self, CustomModel>
     public func total() -> Map { map(\.count) }
 }
 */

import Combine

public extension Publisher where Output: CustomStringConvertible {
    func description() -> Publishers.Map<Self, String> {
        map(\.description)
    }

    func descriptionAsOptional() -> Publishers.Map<Self, String?> {
        map { .some($0.description) }
    }
}

public extension Publisher where Output == Int {
    func formatted() -> Publishers.Map<Self, String?> {
        map{$0.formatted()}
    }
}

public extension Publisher where Output: CustomStringConvertible,
                          Failure == Never {
  func assignDescription(to published:
                          inout Published<String>.Publisher) {
    description().assign(to: &published)
  }
  
  func assignDescription(asOptionalTo published:
                          inout Published<String?>.Publisher) {
    descriptionAsOptional().assign(to: &published)
  }
}

/*
 extension Publisher where Output == CustomModel {
     public typealias Map = Publishers.Map<Self, CustomModel>
     public func total() -> Map { map(\.count) }
 }
 */

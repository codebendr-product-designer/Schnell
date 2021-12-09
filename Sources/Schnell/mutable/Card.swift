public struct Card: Equatable {
    public let rank: Rank
    public let suit: Suit
}

extension Card: CustomStringConvertible {
    public var description: String {
        "\(rank) \(suit)"
    }
}

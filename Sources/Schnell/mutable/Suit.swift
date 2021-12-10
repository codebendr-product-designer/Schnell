public let suits = Suit.allCases
public let numberOfSuits = suits.count

public enum Suit: String, CaseIterable {
    case spades = "♠︎"
    case diamonds = "♦︎"
    case clubs = "♣︎"
    case hearts = "♥︎"

    var suits: [Self] { Self.allCases }
    var count: Int { suits.count }
}

extension Suit: CustomStringConvertible {
    public var description: String {
        rawValue
    }
}

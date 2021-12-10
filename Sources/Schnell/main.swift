import Darwin

// work with raw memory
// let pointer = malloc(100)
// defer {
//    free(pointer)
// }

let threeOfClubs = Card(rank: .three, suit: .clubs)
print(threeOfClubs)

var mutableCard = MutableCard(.three, of: .clubs)

func changeRank(of card: MutableCard, to rank: Rank) {
    card.rank = rank
}

func incrementRank() -> Rank {
    let index = ranks.firstIndex(of: mutableCard.rank) ?? 0
    let rank = ranks[(index + 1) % numberOfRanks]
    changeRank(of: mutableCard,
               to: rank)
    return rank
}

changeRank(of: mutableCard, to: .queen)
print(mutableCard)
print(incrementRank())
print(mutableCard)
print(incrementRank())
print(mutableCard)

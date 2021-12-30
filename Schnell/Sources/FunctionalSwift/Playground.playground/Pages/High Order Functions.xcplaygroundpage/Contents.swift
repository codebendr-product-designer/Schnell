
// map

func map<Element, T>(_ array: [Element], transform: (Element) -> T) -> [T] {
    array.map(transform)
}

map([1, 2, 3]) {
    print("number \($0)")
}

struct City {
    let name: String
    let population: Int
}

let paris = City(name: "Paris", population: 2241)
let madrid = City(name: "Madrid", population: 3165)
let amsterdam = City(name: "Amsterdam", population: 827)
let berlin = City(name: "Berlin", population: 3562)
let cities = [paris, madrid, amsterdam, berlin]

extension City {
    func scalingPopulation() -> City {
        return City(name: name, population: population * 1000)
    }
}

cities.filter { $0.population > 1000 }
    .map { $0.scalingPopulation() }
    .reduce("City: Population") { result, c in
        result + "\n" + "\(c.name): \(c.population)"
}

/*
 City: Population
 Paris: 2241000
 Madrid: 3165000
 Berlin: 3562000
 */

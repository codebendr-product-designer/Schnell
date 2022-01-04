import Foundation
import SwiftUI

struct Ingredient: Identifiable, Codable {
    var id: String
    var name: String
    var title = CardTitle()
    var thumbnailCrop = Crop()
    var cardCrop = Crop()

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}


extension Ingredient {
    
    /// Defines how the `Ingredient`'s title should be displayed in card mode
    struct CardTitle {
        var color = Color.black
        var rotation = Angle.degrees(0)
        var offset = CGSize.zero
        var blendMode = BlendMode.normal
        var opacity: Double = 1
        var fontSize: Double = 1
    }
    
    /// Defines a state for the `Ingredient` to transition from when changing between card and thumbnail
    struct Crop {
        var xOffset: Double = 0
        var yOffset: Double = 0
        var scale: Double = 1
        
        var offset: CGSize {
            CGSize(width: xOffset, height: yOffset)
        }
    }
    
    /// The `Ingredient`'s image, useful for backgrounds or thumbnails
    var image: Image {
        Image("ingredient/\(id)", label: Text(name))
            .renderingMode(.original)
    }
}

// MARK: - All Recipes

extension Ingredient {
    static let avocado = Ingredient(
        id: "avocado",
        name: String(localized: "Avocado", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            color: .brown,
            offset: CGSize(width: 0, height: 20),
            blendMode: .plusDarker,
            opacity: 0.4,
            fontSize: 60
        )
    )
    
    static let almondMilk = Ingredient(
        id: "almond-milk",
        name: String(localized: "Almond Milk", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            offset: CGSize(width: 0, height: -140),
            blendMode: .overlay,
            fontSize: 40
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 1)
    )
    
    static let banana = Ingredient(
        id: "banana",
        name: String(localized: "Banana", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            rotation: Angle.degrees(-30),
            offset: CGSize(width: 0, height: 0),
            blendMode: .overlay,
            fontSize: 70
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 1)
    )
    
    static let blueberry = Ingredient(
        id: "blueberry",
        name: String(localized: "Blueberry", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            color: .white,
            offset: CGSize(width: 0, height: 100),
            opacity: 0.5,
            fontSize: 45
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 2)
    )
    
    static let carrot = Ingredient(
        id: "carrot",
        name: String(localized: "Carrot", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            rotation: Angle.degrees(-90),
            offset: CGSize(width: -120, height: 100),
            blendMode: .plusDarker,
            opacity: 0.3,
            fontSize: 70
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 1.2)
    )
    
    static let chocolate = Ingredient(
        id: "chocolate",
        name: String(localized: "Chocolate", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            color: .brown,
            rotation: Angle.degrees(-11),
            offset: CGSize(width: 0, height: 10),
            blendMode: .plusDarker,
            opacity: 0.8,
            fontSize: 45
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 1)
    )
    
    static let coconut = Ingredient(
        id: "coconut",
        name: String(localized: "Coconut", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            color: .brown,
            offset: CGSize(width: 40, height: 110),
            blendMode: .plusDarker,
            opacity: 0.8,
            fontSize: 36
        ),
        thumbnailCrop: Crop(scale: 1.5)
    )
    
    static let kiwi = Ingredient(
        id: "kiwi",
        name: String(localized: "Kiwi", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            offset: CGSize(width: 0, height: 0),
            blendMode: .overlay,
            fontSize: 140
        ),
        thumbnailCrop: Crop(scale: 1.1)
    )
    
    static let lemon = Ingredient(
        id: "lemon",
        name: String(localized: "Lemon", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            rotation: Angle.degrees(-9),
            offset: CGSize(width: 15, height: 90),
            blendMode: .overlay,
            fontSize: 80
        ),
        thumbnailCrop: Crop(scale: 1.1)
    )
    
    static let mango = Ingredient(
        id: "mango",
        name: String(localized: "Mango", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            color: .orange,
            offset: CGSize(width: 0, height: 20),
            blendMode: .plusLighter,
            fontSize: 70
        )
    )
    
    static let orange = Ingredient(
        id: "orange",
        name: String(localized: "Orange", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            rotation: Angle.degrees(-90),
            offset: CGSize(width: -130, height: -60),
            blendMode: .overlay,
            fontSize: 80
        ),
        thumbnailCrop: Crop(yOffset: -15, scale: 2)
    )
    
    static let papaya = Ingredient(
        id: "papaya",
        name: String(localized: "Papaya", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            offset: CGSize(width: -20, height: 20),
            blendMode: .overlay,
            fontSize: 70
        ),
        thumbnailCrop: Crop(scale: 1)
    )
    
    static let peanutButter = Ingredient(
        id: "peanut-butter",
        name: String(localized: "Peanut Butter", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            offset: CGSize(width: 0, height: 190),
            blendMode: .overlay,
            fontSize: 35
        ),
        thumbnailCrop: Crop(yOffset: -20, scale: 1.2)
    )
    
    static let pineapple = Ingredient(
        id: "pineapple",
        name: String(localized: "Pineapple", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            color: .yellow,
            offset: CGSize(width: 0, height: 90),
            blendMode: .plusLighter,
            opacity: 0.5,
            fontSize: 55
        )
    )
    
    static let raspberry = Ingredient(
        id: "raspberry",
        name: String(localized: "Raspberry", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            color: .pink,
            blendMode: .plusLighter,
            fontSize: 50
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 1.5)
    )
    
    static let spinach = Ingredient(
        id: "spinach",
        name: String(localized: "Spinach", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            offset: CGSize(width: 0, height: -150),
            blendMode: .overlay,
            fontSize: 70
        ),
        thumbnailCrop: Crop(yOffset: 0, scale: 1)
    )
    
    static let strawberry = Ingredient(
        id: "strawberry",
        name: String(localized: "Strawberry", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            color: .white,
            offset: CGSize(width: 35, height: -5),
            blendMode: .softLight,
            opacity: 0.7,
            fontSize: 30
        ),
        thumbnailCrop: Crop(scale: 2.5),
        cardCrop: Crop(xOffset: -110, scale: 1.35)
    )

    static let water = Ingredient(
        id: "water",
        name: String(localized: "Water", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            color: .blue,
            offset: CGSize(width: 0, height: 150),
            opacity: 0.2,
            fontSize: 50
        ),
        thumbnailCrop: Crop(yOffset: -10, scale: 1.2)
    )
    
    static let watermelon = Ingredient(
        id: "watermelon",
        name: String(localized: "Watermelon", table: "Ingredients", comment: "Ingredient name"),
        title: CardTitle(
            rotation: Angle.degrees(-50),
            offset: CGSize(width: -80, height: -50),
            blendMode: .overlay,
            fontSize: 25
        ),
        thumbnailCrop: Crop(yOffset: -10, scale: 1.2)
    )
}


// MARK: - All Ingredients

extension Ingredient {
    static let all: [Ingredient] = [
        .avocado,
        .almondMilk,
        .banana,
        .blueberry,
        .carrot,
        .chocolate,
        .coconut,
        .kiwi,
        .lemon,
        .mango,
        .orange,
        .papaya,
        .peanutButter,
        .pineapple,
        .raspberry,
        .spinach,
        .strawberry,
        .watermelon
    ]
    
    init?(for id: Ingredient.ID) {
        guard let result = Ingredient.all.first(where: { $0.id == id }) else {
            return nil
        }
        self = result
    }
}

extension Ingredient {
    var nutritionFact: NutritionFact? {
        NutritionFact.lookupFoodItem(id, forVolume: .cups(1))
    }
}

struct MeasuredIngredient: Identifiable, Codable {
    var ingredient: Ingredient
    var measurement: Measurement<UnitVolume>

    init(_ ingredient: Ingredient, measurement: Measurement<UnitVolume>) {
        self.ingredient = ingredient
        self.measurement = measurement
    }

    // Identifiable
    var id: Ingredient.ID { ingredient.id }
}

extension MeasuredIngredient {
    var kilocalories: Int {
        guard let nutritionFact = nutritionFact else {
            return 0
        }
        return Int(nutritionFact.kilocalories)
    }

    // Nutritional information according to the quantity of this measurement.
    var nutritionFact: NutritionFact? {
        guard let nutritionFact = ingredient.nutritionFact else {
            return nil
        }
        let mass = measurement.convertedToMass(usingDensity: nutritionFact.density)
        return nutritionFact.converted(toMass: mass)
    }
}

extension Ingredient {
    func measured(with unit: UnitVolume) -> MeasuredIngredient {
        MeasuredIngredient(self, measurement: Measurement(value: 1, unit: unit))
    }
}

extension MeasuredIngredient {
    func scaled(by scale: Double) -> MeasuredIngredient {
        return MeasuredIngredient(ingredient, measurement: measurement * scale)
    }
}


public struct Density {
    public var mass: Measurement<UnitMass>
    public var volume: Measurement<UnitVolume>

    public init(_ massAmount: Double, _ massUnit: UnitMass, per volumeAmount: Double, _ volumeUnit: UnitVolume) {
        self.mass = Measurement(value: massAmount, unit: massUnit)
        self.volume = Measurement(value: volumeAmount, unit: volumeUnit)
    }

    public init(mass: Measurement<UnitMass>, volume: Measurement<UnitVolume>) {
        self.mass = mass
        self.volume = volume
    }
}

public struct NutritionFact {
    public var identifier: String
    public var localizedFoodItemName: String

    public var referenceMass: Measurement<UnitMass>

    public var density: Density

    public var totalSaturatedFat: Measurement<UnitMass>
    public var totalMonounsaturatedFat: Measurement<UnitMass>
    public var totalPolyunsaturatedFat: Measurement<UnitMass>
    public var totalFat: Measurement<UnitMass> {
        return totalSaturatedFat + totalMonounsaturatedFat + totalPolyunsaturatedFat
    }

    public var cholesterol: Measurement<UnitMass>
    public var sodium: Measurement<UnitMass>

    public var totalCarbohydrates: Measurement<UnitMass>
    public var dietaryFiber: Measurement<UnitMass>
    public var sugar: Measurement<UnitMass>

    public var protein: Measurement<UnitMass>

    public var calcium: Measurement<UnitMass>
    public var potassium: Measurement<UnitMass>

    public var vitaminA: Measurement<UnitMass>
    public var vitaminC: Measurement<UnitMass>
    public var iron: Measurement<UnitMass>
}

let nutritionFacts = [String: NutritionFact]()
//let nutritionFacts: [String: NutritionFact] = {
//        if let jsonURL = Bundle.main.url(forResource: "NutritionalItems", withExtension: "json"),
//           let jsonData = try? Data(contentsOf: jsonURL),
//           let facts = try? JSONDecoder().decode(Dictionary<String, NutritionFact>.self, from: jsonData) {
//            return facts
//        } else {
//            return [String: NutritionFact]()
//        }
//    }()

extension NutritionFact {
    public func converted(toVolume newReferenceVolume: Measurement<UnitVolume>) -> NutritionFact {
        let newRefMassInCups = newReferenceVolume.converted(to: .cups).value
        let oldRefMassInCups = referenceMass.convertedToVolume(usingDensity: self.density).value

        let scaleFactor = newRefMassInCups / oldRefMassInCups

        return NutritionFact(
            identifier: identifier,
            localizedFoodItemName: localizedFoodItemName,
            referenceMass: referenceMass * scaleFactor,
            density: density,
            totalSaturatedFat: totalSaturatedFat * scaleFactor,
            totalMonounsaturatedFat: totalMonounsaturatedFat * scaleFactor,
            totalPolyunsaturatedFat: totalPolyunsaturatedFat * scaleFactor,
            cholesterol: cholesterol * scaleFactor,
            sodium: sodium * scaleFactor,
            totalCarbohydrates: totalCarbohydrates * scaleFactor,
            dietaryFiber: dietaryFiber * scaleFactor,
            sugar: sugar * scaleFactor,
            protein: protein * scaleFactor,
            calcium: calcium * scaleFactor,
            potassium: potassium * scaleFactor,
            vitaminA: vitaminA * scaleFactor,
            vitaminC: vitaminC * scaleFactor,
            iron: iron * scaleFactor
        )
    }

    public func converted(toMass newReferenceMass: Measurement<UnitMass>) -> NutritionFact {
        let newRefMassInGrams = newReferenceMass.converted(to: .grams).value
        let oldRefMassInGrams = referenceMass.converted(to: .grams).value
        let scaleFactor = newRefMassInGrams / oldRefMassInGrams
        return NutritionFact(
            identifier: identifier,
            localizedFoodItemName: localizedFoodItemName,
            referenceMass: newReferenceMass,
            density: density,
            totalSaturatedFat: totalSaturatedFat * scaleFactor,
            totalMonounsaturatedFat: totalMonounsaturatedFat * scaleFactor,
            totalPolyunsaturatedFat: totalPolyunsaturatedFat * scaleFactor,
            cholesterol: cholesterol * scaleFactor,
            sodium: sodium * scaleFactor,
            totalCarbohydrates: totalCarbohydrates * scaleFactor,
            dietaryFiber: dietaryFiber * scaleFactor,
            sugar: sugar * scaleFactor,
            protein: protein * scaleFactor,
            calcium: calcium * scaleFactor,
            potassium: potassium * scaleFactor,
            vitaminA: vitaminA * scaleFactor,
            vitaminC: vitaminC * scaleFactor,
            iron: iron * scaleFactor
        )
    }

    public func amount(_ mass: Measurement<UnitMass>) -> NutritionFact {
        return converted(toMass: mass)
    }

    public func amount(_ volume: Measurement<UnitVolume>) -> NutritionFact {
        let mass = volume.convertedToMass(usingDensity: density)
        return converted(toMass: mass)
    }
}


private let kilocaloriesInFat: Double = 9
private let kilocaloriesInCarb: Double = 4
private let kilocaloriesInProtein: Double = 4

public struct CalorieBreakdown {
    public let percentFat: Double
    public let percentCarbohydrate: Double
    public let percentProtein: Double

    public var labeledValues: [(String, Double)] {
        return [
            ("Protein", percentProtein),
            ("Fat", percentFat),
            ("Carbohydrates", percentCarbohydrate)
        ]
    }
}

extension NutritionFact {
    public var kilocaloriesFromFat: Double {
        totalFat.converted(to: .grams).value * kilocaloriesInFat
    }

    public var kilocaloriesFromCarbohydrates: Double {
        (totalCarbohydrates - dietaryFiber).converted(to: .grams).value * kilocaloriesInCarb
    }

    public var kilocaloriesFromProtein: Double {
        protein.converted(to: .grams).value * kilocaloriesInProtein
    }

    public var kilocalories: Double {
        kilocaloriesFromFat + kilocaloriesFromCarbohydrates + kilocaloriesFromProtein
    }

    public var energy: Measurement<UnitEnergy> {
        return Measurement<UnitEnergy>(value: kilocalories, unit: .kilocalories)
    }

    public var calorieBreakdown: CalorieBreakdown {
        let totalKilocalories = kilocalories
        let percentFat = kilocaloriesFromFat / totalKilocalories * 100
        let percentCarbohydrate = kilocaloriesFromCarbohydrates / totalKilocalories * 100
        let percentProtein = kilocaloriesFromProtein / totalKilocalories * 100
        return CalorieBreakdown(
            percentFat: percentFat,
            percentCarbohydrate: percentCarbohydrate,
            percentProtein: percentProtein
        )
    }
}


extension NutritionFact {
    /// Nutritional information is for 100 grams, unless a `mass` is specified.
    public static func lookupFoodItem(_ foodItemIdentifier: String,
                                      forMass mass: Measurement<UnitMass> = Measurement(value: 100, unit: .grams)) -> NutritionFact? {
        return nutritionFacts[foodItemIdentifier]?.converted(toMass: mass)
    }

    /// Nutritional information is for 1 cup, unless a `volume` is specified.
    public static func lookupFoodItem(_ foodItemIdentifier: String,
                                      forVolume volume: Measurement<UnitVolume> = Measurement(value: 1, unit: .cups)) -> NutritionFact? {
        guard let nutritionFact = nutritionFacts[foodItemIdentifier] else {
            return nil
        }

        // Convert volume to mass via density
        let mass = volume.convertedToMass(usingDensity: nutritionFact.density)
        return nutritionFact.converted(toMass: mass)
    }

    // MARK: - Examples

    public static var banana: NutritionFact {
        nutritionFacts["banana"]!
    }

    public static var blueberry: NutritionFact {
        nutritionFacts["blueberry"]!
    }

    public static var peanutButter: NutritionFact {
        nutritionFacts["peanut-butter"]!
    }

    public static var almondMilk: NutritionFact {
        nutritionFacts["almond-milk"]!
    }

    public static var zero: NutritionFact {
        NutritionFact(
            identifier: "",
            localizedFoodItemName: "",
            referenceMass: .grams(0),
            density: Density(mass: .grams(1), volume: .cups(1)),
            totalSaturatedFat: .grams(0),
            totalMonounsaturatedFat: .grams(0),
            totalPolyunsaturatedFat: .grams(0),
            cholesterol: .grams(0),
            sodium: .grams(0),
            totalCarbohydrates: .grams(0),
            dietaryFiber: .grams(0),
            sugar: .grams(0),
            protein: .grams(0),
            calcium: .grams(0),
            potassium: .grams(0),
            vitaminA: .grams(0),
            vitaminC: .grams(0),
            iron: .grams(0)
        )
    }
}

extension NutritionFact {
    // Support adding up nutritional facts
    public static func + (lhs: NutritionFact, rhs: NutritionFact) -> NutritionFact {
        // Calculate combined mass, volume and density
        let totalMass = lhs.referenceMass + rhs.referenceMass
        let lhsVolume = lhs.referenceMass.convertedToVolume(usingDensity: lhs.density)
        let rhsVolume = lhs.referenceMass.convertedToVolume(usingDensity: lhs.density)
        let totalVolume = lhsVolume + rhsVolume

        return NutritionFact(
            identifier: "",
            localizedFoodItemName: "",
            referenceMass: totalMass,
            density: Density(mass: totalMass, volume: totalVolume),
            totalSaturatedFat: lhs.totalSaturatedFat + rhs.totalSaturatedFat,
            totalMonounsaturatedFat: lhs.totalMonounsaturatedFat + rhs.totalMonounsaturatedFat,
            totalPolyunsaturatedFat: lhs.totalPolyunsaturatedFat + rhs.totalPolyunsaturatedFat,
            cholesterol: lhs.cholesterol + rhs.cholesterol,
            sodium: lhs.sodium + rhs.sodium,
            totalCarbohydrates: lhs.totalCarbohydrates + rhs.totalCarbohydrates,
            dietaryFiber: lhs.dietaryFiber + rhs.dietaryFiber,
            sugar: lhs.sugar + rhs.sugar,
            protein: lhs.protein + rhs.protein,
            calcium: lhs.calcium + rhs.calcium,
            potassium: lhs.potassium + rhs.potassium,
            vitaminA: lhs.vitaminA + rhs.vitaminA,
            vitaminC: lhs.vitaminC + rhs.vitaminC,
            iron: lhs.iron + rhs.iron
        )
    }
}

// MARK: - CustomStringConvertible

//extension NutritionFact: CustomStringConvertible {
//    public var description: String {
//        let suffix = identifier.isEmpty ? "" : " of \(identifier)"
//        return "\(referenceMass.converted(to: .grams).localizedSummary(unitStyle: .medium))" + suffix
//    }
//}

// MARK: - Volume <-> Mass Conversion

extension Measurement where UnitType == UnitVolume {
    public func convertedToMass(usingDensity density: Density) -> Measurement<UnitMass> {
        let densityLiters = density.volume.converted(to: .liters).value
        let liters = converted(to: .liters).value
        let scale = liters / densityLiters
        return density.mass * scale
    }
}

extension Measurement where UnitType == UnitMass {
    public func convertedToVolume(usingDensity density: Density) -> Measurement<UnitVolume> {
        let densityKilograms = density.mass.converted(to: .kilograms).value
        let kilograms = converted(to: .kilograms).value
        let scale = kilograms / densityKilograms
        return density.volume * scale
    }
}

// MARK: - Convenience Accessors

extension Measurement where UnitType == UnitVolume {
    public static func cups(_ cups: Double) -> Measurement<UnitVolume> {
        return Measurement(value: cups, unit: .cups)
    }

    public static func tablespoons(_ tablespoons: Double) -> Measurement<UnitVolume> {
        return Measurement(value: tablespoons, unit: .tablespoons)
    }
}

extension Measurement where UnitType == UnitMass {
    public static func grams(_ grams: Double) -> Measurement<UnitMass> {
        return Measurement(value: grams, unit: .grams)
    }
}



struct Smoothie: Identifiable, Codable {
    var id: String
    var title: String
    var description: AttributedString
    var measuredIngredients: [MeasuredIngredient]
}

extension Smoothie {
    init?(for id: Smoothie.ID) {
        guard let smoothie = Smoothie.all().first(where: { $0.id == id }) else { return nil }
        self = smoothie
    }

    var kilocalories: Int {
        let value = measuredIngredients.reduce(0) { total, ingredient in total + ingredient.kilocalories }
        return Int(round(Double(value) / 10.0) * 10)
    }

    var energy: Measurement<UnitEnergy> {
        return Measurement<UnitEnergy>(value: Double(kilocalories), unit: .kilocalories)
    }

    // The nutritional information for the combined ingredients
    var nutritionFact: NutritionFact {
        let facts = measuredIngredients.compactMap { $0.nutritionFact }
        guard let firstFact = facts.first else {
            print("Could not find nutrition facts for \(title) — using `banana`'s nutrition facts.")
            return .banana
        }
        return facts.dropFirst().reduce(firstFact, +)
    }
    
    var menuIngredients: [MeasuredIngredient] {
        measuredIngredients.filter { $0.id != Ingredient.water.id }
    }
    
    func matches(_ string: String) -> Bool {
        string.isEmpty ||
        title.localizedCaseInsensitiveContains(string) ||
        menuIngredients.contains {
            $0.ingredient.name.localizedCaseInsensitiveContains(string)
        }
    }
}

extension Smoothie: Hashable {
    static func == (lhs: Smoothie, rhs: Smoothie) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Smoothie List
extension Smoothie {
    @SmoothieArrayBuilder
    static func all(includingPaid: Bool = true) -> [Smoothie] {
        Smoothie(id: "berry-blue", title: String(localized: "Berry Blue", comment: "Smoothie name")) {
            AttributedString(localized: "*Filling* and *refreshing*, this smoothie will fill you with joy!",
                             comment: "Berry Blue smoothie description")

            Ingredient.orange.measured(with: .cups).scaled(by: 1.5)
            Ingredient.blueberry.measured(with: .cups)
            Ingredient.avocado.measured(with: .cups).scaled(by: 0.2)
        }

        Smoothie(id: "carrot-chops", title: String(localized: "Carrot Chops", comment: "Smoothie name")) {
            AttributedString(localized: "*Packed* with vitamin A and C, Carrot Chops is a great way to start your day!",
                             comment: "Carrot Chops smoothie description")

            Ingredient.orange.measured(with: .cups).scaled(by: 1.5)
            Ingredient.carrot.measured(with: .cups).scaled(by: 0.5)
            Ingredient.mango.measured(with: .cups).scaled(by: 0.5)
        }

        if includingPaid {
            Smoothie(id: "pina-y-coco", title: String(localized: "Piña y Coco", comment: "Smoothie name")) {
                AttributedString(localized: "Enjoy the *tropical* flavors of coconut and pineapple!", comment: "Piña y Coco smoothie description")
                Ingredient.pineapple.measured(with: .cups).scaled(by: 1.5)
                Ingredient.almondMilk.measured(with: .cups)
                Ingredient.coconut.measured(with: .cups).scaled(by: 0.5)
            }

            Smoothie(id: "hulking-lemonade", title: String(localized: "Hulking Lemonade", comment: "Smoothie name")) {
                AttributedString(localized: "This is not just *any* lemonade. It will give you *powers* you'll struggle to control!",
                                  comment: "Hulking Lemonade smoothie description")
                Ingredient.lemon.measured(with: .cups).scaled(by: 1.5)
                Ingredient.spinach.measured(with: .cups)
                Ingredient.avocado.measured(with: .cups).scaled(by: 0.2)
                Ingredient.water.measured(with: .cups).scaled(by: 0.2)
            }

            Smoothie(id: "kiwi-cutie", title: String(localized: "Kiwi Cutie", comment: "Smoothie name")) {
                AttributedString(localized: "Kiwi Cutie is beautiful *inside* ***and*** *out*! Packed with nutrients to start your day!",
                                  comment: "Kiwi Cutie smoothie description")
                Ingredient.kiwi.measured(with: .cups)
                Ingredient.orange.measured(with: .cups)
                Ingredient.spinach.measured(with: .cups)
            }

            Smoothie( id: "lemonberry", title: String(localized: "Lemonberry", comment: "Smoothie name")) {
                AttributedString(localized: "A refreshing blend that's a *real kick*!", comment: "Lemonberry smoothie description")

                Ingredient.raspberry.measured(with: .cups)
                Ingredient.strawberry.measured(with: .cups)
                Ingredient.lemon.measured(with: .cups).scaled(by: 0.5)
                Ingredient.water.measured(with: .cups).scaled(by: 0.5)

            }

            Smoothie(id: "love-you-berry-much", title: String(localized: "Love You Berry Much", comment: "Smoothie name")) {
                AttributedString(localized: "If you *love* berries berry berry much, you will love this one!",
                                 comment: "Love You Berry Much smoothie description")

                Ingredient.strawberry.measured(with: .cups).scaled(by: 0.75)
                Ingredient.blueberry.measured(with: .cups).scaled(by: 0.5)
                Ingredient.raspberry.measured(with: .cups).scaled(by: 0.5)
                Ingredient.water.measured(with: .cups).scaled(by: 0.5)
            }

            Smoothie(id: "mango-jambo", title: String(localized: "Mango Jambo", comment: "Smoothie name")) {
                AttributedString(localized: "Dance around with this *delicious* tropical blend!", comment: "Mango Jambo smoothie description")

                Ingredient.mango.measured(with: .cups)
                Ingredient.pineapple.measured(with: .cups).scaled(by: 0.5)
                Ingredient.water.measured(with: .cups).scaled(by: 0.5)
            }

            Smoothie(id: "one-in-a-melon", title: String(localized: "One in a Melon", comment: "Smoothie name")) {
                AttributedString(localized: "Feel special this summer with the *coolest* drink in our menu!",
                                 comment: "One in a Melon smoothie description")

                Ingredient.watermelon.measured(with: .cups).scaled(by: 2)
                Ingredient.raspberry.measured(with: .cups)
                Ingredient.water.measured(with: .cups).scaled(by: 0.5)
            }

            Smoothie(id: "papas-papaya", title: String(localized: "Papa's Papaya", comment: "Smoothie name")) {
                AttributedString(localized: "Papa would be proud of you if he saw you drinking this!", comment: "Papa's Papaya smoothie description")

                Ingredient.orange.measured(with: .cups)
                Ingredient.mango.measured(with: .cups).scaled(by: 0.5)
                Ingredient.papaya.measured(with: .cups).scaled(by: 0.5)
            }

            Smoothie(id: "peanut-butter-cup", title: String(localized: "Peanut Butter Cup", comment: "Smoothie name")) {
                AttributedString(localized: "Ever wondered what it was like to *drink a peanut butter cup*? Wonder no more!",
                                 comment: "Peanut Butter Cup smoothie description")

                Ingredient.almondMilk.measured(with: .cups)
                Ingredient.banana.measured(with: .cups).scaled(by: 0.5)
                Ingredient.chocolate.measured(with: .tablespoons).scaled(by: 2)
                Ingredient.peanutButter.measured(with: .tablespoons)
            }

            Smoothie(id: "sailor-man", title: String(localized: "Sailor Man", comment: "Smoothie name")) {
                AttributedString(localized: "*Get strong* with this delicious spinach smoothie!", comment: "Sailor Man smoothie description")

                Ingredient.orange.measured(with: .cups).scaled(by: 1.5)
                Ingredient.spinach.measured(with: .cups)
            }

            Smoothie(id: "thats-a-smore", title: String(localized: "That's a Smore!", comment: "Smoothie name")) {
                AttributedString(localized: "When the world seems to rock like you've had too much choc, that's *a smore*!",
                                 comment: "That's a Smore! smoothie description")

                Ingredient.almondMilk.measured(with: .cups)
                Ingredient.coconut.measured(with: .cups).scaled(by: 0.5)
                Ingredient.chocolate.measured(with: .tablespoons)
            }
        }

        Smoothie(id: "thats-berry-bananas", title: String(localized: "That's Berry Bananas!", comment: "Smoothie name")) {
            AttributedString(localized: "You'll go *crazy* with this classic!", comment: "That's Berry Bananas! smoothie description")

            Ingredient.almondMilk.measured(with: .cups)
            Ingredient.banana.measured(with: .cups)
            Ingredient.strawberry.measured(with: .cups)
        }

        if includingPaid {
            Smoothie(id: "tropical-blue", title: String(localized: "Tropical Blue", comment: "Smoothie name")) {
                AttributedString(
                    localized: "A delicious blend of *tropical fruits and blueberries* will have you sambaing around like you never knew you could!",
                                  comment: "Tropical Blue smoothie description")
                Ingredient.almondMilk.measured(with: .cups)
                Ingredient.banana.measured(with: .cups).scaled(by: 0.5)
                Ingredient.blueberry.measured(with: .cups).scaled(by: 0.5)
                Ingredient.mango.measured(with: .cups).scaled(by: 0.5)
            }
        }
    }

    // Used in previews.
    static var berryBlue: Smoothie { Smoothie(for: "berry-blue")! }
    static var kiwiCutie: Smoothie { Smoothie(for: "kiwi-cutie")! }
    static var hulkingLemonade: Smoothie { Smoothie(for: "hulking-lemonade")! }
    static var mangoJambo: Smoothie { Smoothie(for: "mango-jambo")! }
    static var tropicalBlue: Smoothie { Smoothie(for: "tropical-blue")! }
    static var lemonberry: Smoothie { Smoothie(for: "lemonberry")! }
    static var oneInAMelon: Smoothie { Smoothie(for: "one-in-a-melon")! }
    static var thatsASmore: Smoothie { Smoothie(for: "thats-a-smore")! }
    static var thatsBerryBananas: Smoothie { Smoothie(for: "thats-berry-bananas")! }
}

extension Smoothie {
    init(id: Smoothie.ID, title: String, @SmoothieBuilder _ makeIngredients: () -> (AttributedString, [MeasuredIngredient])) {
        let (description, ingredients) = makeIngredients()
        self.init(id: id, title: title, description: description, measuredIngredients: ingredients)
    }
}

@resultBuilder
enum SmoothieBuilder {
    static func buildBlock(_ description: AttributedString, _ ingredients: MeasuredIngredient...) -> (AttributedString, [MeasuredIngredient]) {
        return (description, ingredients)
    }

    @available(*, unavailable, message: "first statement of SmoothieBuilder must be its description String")
    static func buildBlock(_ ingredients: MeasuredIngredient...) -> (String, [MeasuredIngredient]) {
        fatalError()
    }
}

@resultBuilder
enum SmoothieArrayBuilder {
    static func buildEither(first component: [Smoothie]) -> [Smoothie] {
        return component
    }

    static func buildEither(second component: [Smoothie]) -> [Smoothie] {
        return component
    }

    static func buildOptional(_ component: [Smoothie]?) -> [Smoothie] {
        return component ?? []
    }

    static func buildExpression(_ expression: Smoothie) -> [Smoothie] {
        return [expression]
    }

    static func buildExpression(_ expression: ()) -> [Smoothie] {
        return []
    }

    static func buildBlock(_ smoothies: [Smoothie]...) -> [Smoothie] {
        return smoothies.flatMap { $0 }
    }
}

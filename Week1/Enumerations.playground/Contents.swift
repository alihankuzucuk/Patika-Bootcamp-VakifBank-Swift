import Foundation

// MARK: - Enumerations
// An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code
// If a value (known as a raw value) is provided for each enumeration case, the value can be a string, a character, or a value of any integer or floating-point type

enum CompassPoint {
    case north
    case south
    case east
    case west
}

// Multiple cases can appear on a single line, separated by commas:
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// Each enumeration definition defines a new type
// Give enumeration types singular rather than plural names, so that they read as self-evident:
var directionToHead = CompassPoint.west

// The type of directionToHead is inferred when it’s initialized with one of the possible values of CompassPoint
// Once directionToHead is declared as a CompassPoint, you can set it to a different CompassPoint value using a shorter dot syntax:
directionToHead = .east

// MARK: - Matching Enumeration Values with a Switch Statement
directionToHead = .south
switch directionToHead {
    case .north:
        print("Lots of planets have a north")
    case .south:
        print("Watch out for penguins")
    case .east:
        print("Where the sun rises")
    case .west:
        print("Where the skies are blue")
}
// Prints "Watch out for penguins"

// MARK: - Iterating over Enumeration Cases
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"

for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
// juice

// MARK: - Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

/**
 If all of the associated values for an enumeration case are extracted as constants,
 or if all are extracted as variables, you can place a single var or let annotation before the case name, for brevity:
 */
switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
    case let .qrCode(productCode):
        print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

// MARK: - Raw Values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Raw values can be strings, characters, or any of the integer or floating-point number types
// Each raw value must be unique within its enumeration declaration

// MARK: - Implicitly Assigned Raw Values
// When you’re working with enumerations that store integer or string raw values, you don’t have to explicitly assign a raw value for each case
// When you don’t, Swift automatically assigns the values for you
enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// In the example above, Planet2.mercury has an explicit raw value of 1, Planet2.venus has an implicit raw value of 2, and so on

// NOTE: When strings are used for raw values, the implicit value for each case is the text of that case’s name

enum CompassPoint2: String {
    case north, south, east, west
}

// In the example above, CompassPoint2.south has an implicit raw value of "south", and so on

// You access the raw value of an enumeration case with its rawValue property:
let earthsOrder = Planet2.earth.rawValue
// earthsOrder is 3

let sunsetDirection = CompassPoint2.west.rawValue
// sunsetDirection is "west"

// MARK: - Initializing from a Raw Value
/**
 If you define an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a value of the raw value’s type
 (as a parameter called rawValue) and returns either an enumeration case or nil
 */

let possiblePlanet = Planet2(rawValue: 7)
// possiblePlanet is of type Planet2? and equals Planet2.uranus

// If you try to find a planet with a position of 11, the optional Planet2 value returned by the raw value initializer will be nil:
let positionToFind = 11
if let somePlanet = Planet2(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}
// Prints "There isn't a planet at position 11"

// MARK: - Using Computed Property in Enumerations
enum iPhonePrice: Double {
    case iPhone13ProMax
    case iPhone13Pro
    case iPhone13
    
    var iPhonePrice: Double {
        switch self {
            case .iPhone13ProMax:
                    return 20999
            case .iPhone13Pro:
                    return 19999
            case .iPhone13:
                    return 18999
        }
    }
}

let iphoneOfAlihan = iPhonePrice.iPhone13ProMax
iphoneOfAlihan.iPhonePrice
// Returns 20999

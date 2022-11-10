import Foundation

// MARK: - Control Flow

// MARK: - For-In Loops
// You use the for-in loop to iterate over a sequence, such as items in an array, ranges of numbers, or characters in a string
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!

/**
 You can also iterate over a dictionary to access its key-value pairs
 Each item in the dictionary is returned as a (key, value) tuple when the dictionary is iterated, and you can decompose the (key, value) tuple’s members as explicitly named constants for use within the body of the for-in loop
 */
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// cats have 4 legs
// ants have 6 legs
// spiders have 8 legs

// You can also use for-in loops with numeric ranges. This example prints the first few entries in a five-times table:
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

// Some users might want fewer tick marks in their UI. They could prefer one mark every 5 minutes instead. Use the stride(from:to:by:) function to skip the unwanted marks
for tickMark in stride(from: 0, to: 60, by: 5) {
    print(tickMark)
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}

// Closed ranges are also available, by using stride(from:through:by:) instead:
for tickMark in stride(from: 3, through: 12, by: 3) {
    print(tickMark)
    // render the tick mark every 3 hours (3, 6, 9, 12)
}

// You can use this syntax to iterate any collection, including your own classes and collection types, as long as those types conform to the Sequence protocol

// MARK: - While Loops
// A while loop performs a set of statements until a condition becomes false

// while evaluates its condition at the start of each pass through the loop
// repeat-while evaluates its condition at the end of each pass through the loop

var currentLevel: Int = 0
var finalLevel: Int = 5
while (currentLevel <= finalLevel) {
    print("You have passed level: \(currentLevel)")
    currentLevel += 1
}

currentLevel = 0

repeat {
    print("You have passed level: \(currentLevel)")
    currentLevel += 1
}
while (currentLevel <= finalLevel)

// MARK: - Conditional Statements

// MARK: - If
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
// Prints "It's very cold. Consider wearing a scarf."

// MARK: - Switch
// A switch statement considers a value and compares it against several possible matching patterns
// It then executes an appropriate block of code, based on the first pattern that matches successfully
// The body of each case must contain at least one executable statement

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// Prints "The last letter of the alphabet"

// MARK: - Compound Cases in Switch
// To make a switch with a single case that matches both "a" and "A", combine the two values into a compound case, separating the values with commas
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
// Prints "The letter A"

// Compound cases can also include value bindings
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// Prints "On an axis, 9 from the origin"

// MARK: - Interval Matching in Switch
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."

// MARK: - Tuples in Switch
// You can use tuples to test multiple values in the same switch statement
// Each element of the tuple can be tested against a different value or interval of values
// Alternatively, use the underscore character (_), also known as the wildcard pattern, to match any possible value
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// Prints "(1, 1) is inside the box"
// NOTE: If we check for (0,0), It would go to first matching case of (0,0) but also (-2...2, -2...2) is matching

// MARK: - Value Bindings in Switch
//A switch case can name the value or values it matches to temporary constants or variables, for use in the body of the case
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// Prints "on the x-axis with an x value of 2"

// MARK: - Where in Switch
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// Prints "(1, -1) is on the line x == -y"

// MARK: - Control Transfer Statements
//Control transfer statements change the order in which your code is executed, by transferring control from one piece of code to another

// MARK: - Continue
// The continue statement tells a loop to stop what it’s doing and start again at the beginning of the next iteration through the loop
for number in 1...10 {
    if number == 5 {
        continue
    }
    print(number)
}
// MARK: - Break
// The break statement ends execution of an entire control flow statement immediately
for number in 1...10 {
    if number == 5 {
        break
    }
    print(number)
}
// MARK: - Labeled Statements
// In Swift, you can nest loops and conditional statements inside other loops and conditional statements to create complex control flow structures
// However, loops and conditional statements can both use the break statement to end their execution prematurely

let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]
outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}

// MARK: - Early Exit (Guard Let)
// Unlike an if statement, a guard statement always has an else clause—the code inside the else clause is executed if the condition isn’t true

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }

    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."

// MARK: - Checking API Availability
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}

/**
 The availability condition above specifies that in iOS, the body of the if statement executes only in iOS 10 and later; in macOS, only in macOS 10.12 and later. The last argument, *, is required and specifies that on any other platform, the body of the if executes on the minimum deployment target specified by your target
 */

@available(macOS 10.12, *)
struct ColorPreference {
    var bestColor = "blue"
}

func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else {
        return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}

// In addition to #available, Swift also supports the opposite check using an unavailability condition
if #available(iOS 10, *) {
} else {
    // Fallback code
}

if #unavailable(iOS 10) {
    // Fallback code
}

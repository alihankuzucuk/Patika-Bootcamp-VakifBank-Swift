import Foundation

// MARK: - Strings and Characters
// The contents of a String can be accessed in various ways, including as a collection of Character values

// MARK: - String Literals
// Use a string literal as an initial value for a constant or variable:

let someString = "Some string literal value"

// MARK: - Multiline String Literals
// If you need a string that spans several lines, use a multiline string literal—a sequence of characters surrounded by three double quotation marks:

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

/**
 When your source code includes a line break inside of a multiline string literal, that line break also appears in the string’s value.
 If you want to use line breaks to make your source code easier to read, but you don’t want the line breaks to be part of the string’s value,
 write a backslash (\) at the end of those lines:
 */

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

// MARK: - Special Characters in String Literals
// String literals can include the following special characters:

/**
 The escaped special characters:
 \0 (null character)
 \\ (backslash)
 \t (horizontal tab)
 \n (line feed)
 \r (carriage return)
 \" (double quotation mark)
 \' (single quotation mark)
 */

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"

// An arbitrary Unicode scalar value, written as \u{n}, where n is a 1–8 digit hexadecimal number
let dollarSign = "\u{24}" // $, Unicode scalar U+0024

// MARK: - Initializing an Empty String
var emptyString = "" // Empty String Literal
var anotherEmptyString = String() // Initializer Syntax
// These two strings are both empty, and are equivalent to each other

// MARK: - String Mutability
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

// MARK: - Strings Are Value Types
// Swift’s String type is a value type
/**
 If you create a new String value, that String value is copied when it’s passed to a function or method, or when it’s assigned to a constant or variable
 In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version
 */

// MARK: - Working with Characters
for character in "Apple" {
    print(character)
}

// String values can be constructed by passing an array of Character values as an argument to its initializer:
let catCharacters: [Character] = ["C", "a", "t", "!"]
let catString = String(catCharacters)
print(catString)

// MARK: - Concatenating Strings and Characters
// String values can be added together (or concatenated) with the addition operator (+) to create a new String value:
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// welcome now equals "hello there"

var instruction = "look over"
instruction += string2
// instruction now equals "look over there"

// You can append a Character value to a String variable with the String type’s append() method:
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
// welcome now equals "hello there!"

// MARK: - String Interpolation
// String interpolation is a way to construct a new String value from a mix of constants, variables, literals, and expressions by including their values inside a string literal
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

// MARK: - Accessing and Modifying a String
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a

// MARK: - Inserting and Removing

// - EXAMPLE 1
var welcome2 = "hello"
welcome2.insert("!", at: welcome2.endIndex)
// welcome2 now equals "hello!"

welcome2.insert(contentsOf: " there", at: welcome2.index(before: welcome2.endIndex))
// welcome2 now equals "hello there!"

// - EXAMPLE 2
welcome2.remove(at: welcome2.index(before: welcome2.endIndex))
// welcome2 now equals "hello there"

let range = welcome2.index(welcome2.endIndex, offsetBy: -6)..<welcome2.endIndex
welcome.removeSubrange(range)
// welcome2 now equals "hello"

// MARK: - Substrings
let greeting2 = "Hello, world!"
let index2 = greeting2.firstIndex(of: ",") ?? greeting2.endIndex
let beginning = greeting2[..<index2]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)

// MARK: - Comparing Strings
let quotation2 = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation2 == sameQuotation {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"

// MARK: - Prefix and Suffix Equality
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

// - EXAMPLE 1
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"

// - EXAMPLE 2
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"

import Foundation

// MARK: - Constants and Variables
// The value of a constant can’t be changed once it’s set, whereas a variable can be set to a different value in the future

// Declaring Constants and Variables
// Constants and variables must be declared before they’re used
// You declare constants with the let keyword and variables with the var keyword

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

// You can declare multiple constants or multiple variables on a single line, separated by commas:
var x = 0.0, y = 0.0, z = 0.0

// If a stored value in your code won’t change, always declare it as a constant with the let keyword
// Use variables only for storing values that need to be able to change

// MARK: - Type Annotations
// You can provide a type annotation when you declare a constant or variable, to be clear about the kind of values the constant or variable can store
// Write a type annotation by placing a colon after the constant or variable name, followed by a space, followed by the name of the type to use

var welcomeMessage: String
// The colon in the declaration means “…of type…,” so the code above can be read as:
// “Declare a variable called welcomeMessage that’s of type String.”

welcomeMessage = "Hello"

// You can define multiple related variables of the same type on a single line, separated by commas, with a single type annotation after the final variable name:
var red, green, blue: Double

// MARK: - Naming Constants and Variables
// Constant and variable names can contain almost any character, including Unicode characters
// Constant and variable names can’t contain whitespace characters, mathematical symbols, arrows, private-use Unicode scalar values, or line- and box-drawing characters
// Nor can they begin with a number, although numbers may be included elsewhere within the name

// Once you’ve declared a constant or variable of a certain type, you can’t declare it again with the same name, or change it to store values of a different type
// Nor can you change a constant into a variable or a variable into a constant

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// friendlyWelcome is now "Bonjour!"

let languageName = "Swift"
// languageName = "Swift++"
// This is a compile-time error: languageName cannot be changed

// MARK: - Printing Constants and Variables
print("The current value of friendlyWelcome is \(friendlyWelcome)")
// Prints "The current value of friendlyWelcome is Bonjour!"

// MARK: - Comments
// Single-line comments
/* This is also a comment
but is written over multiple lines. */

// Unlike multiline comments in C, multiline comments in Swift can be nested inside other multiline comments
/* This is the start of the first multiline comment.
 /* This is the second, nested multiline comment. */
This is the end of the first multiline comment. */

// MARK: - Semicolons
// Unlike many other languages, Swift doesn’t require you to write a semicolon (;) after each statement in your code, although you can do so if you wish
// However, semicolons are required if you want to write multiple separate statements on a single line:

let cat = "Garfield"; print(cat)

// MARK: - Floating-Point Numbers
// Double represents a 64-bit floating-point number
// Float represents a 32-bit floating-point number
// Double has a precision of at least 15 decimal digits, whereas the precision of Float can be as little as 6 decimal digits

// The appropriate floating-point type to use depends on the nature and range of values you need to work with in your code
// In situations where either type would be appropriate, Double is preferred

// MARK: - Type Safety and Type Inference
// Swift is a type-safe language. A type safe language encourages you to be clear about the types of values your code can work with

// If you don’t specify the type of value you need, Swift uses type inference to work out the appropriate type
// Type inference is particularly useful when you declare a constant or variable with an initial value

let pi = 3.14159
// pi is inferred to be of type Double

// Swift always chooses Double (rather than Float) when inferring the type of floating-point numbers

// If you combine integer and floating-point literals in an expression, a type of Double will be inferred from the context:
let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double

// MARK: - Numeric Literals
// Integer literals can be written as:
// A decimal number, with no prefix
// A binary number, with a 0b prefix
// An octal number, with a 0o prefix
// A hexadecimal number, with a 0x prefix

// All of these integer literals have a decimal value of 17:
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

// Numeric literals can contain extra formatting to make them easier to read
// Both integers and floats can be padded with extra zeros and can contain underscores to help with readability
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// MARK: - Type Aliases
// Type aliases define an alternative name for an existing type. You define type aliases with the typealias keyword

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0

// MARK: - Booleans
// Swift’s type safety prevents non-Boolean values from being substituted for Bool.
// The following example reports a compile-time error

/*
let i = 1
if i {
    // this example will not compile, and will report an error
}
*/

// MARK: - Tuples
// Tuples group multiple values into a single compound value
// The values within a tuple can be of any type and don’t have to be of the same type as each other

let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")

// You can decompose a tuple’s contents into separate constants or variables, which you then access as usual:
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"

print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"

// If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple:
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"

// Alternatively, access the individual element values in a tuple using index numbers starting at zero:
print("The status code is \(http404Error.0)")
// Prints "The status code is 404"

print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"

// You can name the individual elements in a tuple when the tuple is defined:
let http200Status = (statusCode: 200, description: "OK")

// If you name the elements in a tuple, you can use the element names to access the values of those elements:
print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"

print("The status message is \(http200Status.description)")
// Prints "The status message is OK"

// MARK: - Optionals
// You use optionals in situations where a value may be absent. An optional represents two possibilities:
// Either there is a value, and you can unwrap the optional to access that value, or there isn’t a value at all.

// Here’s an example of how optionals can be used to cope with the absence of a value
// Swift’s Int type has an initializer which tries to convert a String value into an Int value
// However, not every string can be converted into an integer
// The string "123" can be converted into the numeric value 123, but the string "hello, world" doesn’t have an obvious numeric value to convert to

// The example below uses the initializer to try to convert a String into an Int:
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int"

// Because the initializer might fail, it returns an optional Int, rather than an Int. An optional Int is written as Int?, not Int

// nil
// You set an optional variable to a valueless state by assigning it the special value nil:
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404

serverResponseCode = nil
// serverResponseCode now contains no value

// If you define an optional variable without providing a default value, the variable is automatically set to nil for you:
var surveyAnswer: String?
// surveyAnswer is automatically set to nil

// If Statements and Forced Unwrapping
// Once you’re sure that the optional does contain a value, you can access its underlying value by adding an exclamation point (!) to the end of the optional’s name
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// Prints "convertedNumber has an integer value of 123."

// Optional Binding
// You use optional binding to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable

// You can rewrite the possibleNumber example from the Optionals section to use optional binding rather than forced unwrapping:
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"

// Because this kind of code is so common, you can use a shorter spelling to unwrap an optional value: write just the name of the constant or variable that you’re unwrapping
// The new, unwrapped constant or variable implicitly uses the same name as the optional value
if let convertedNumber {
    print("convertedNumber is \(convertedNumber)")
}
// Prints "convertedNumber is 123"

// If you wanted to manipulate the value of convertedNumber within the first branch of the if statement,
// you could write if var convertedNumber instead, and the value contained within the optional would be made available as a variable rather than a constant

if var convertedNumber {
    convertedNumber += 1
    print("convertedNumber is \(convertedNumber)")
}

print(convertedNumber!)

if Int(possibleNumber) != nil {
    print("possibleNumber is \(Int(possibleNumber)!)")
}

guard let number = Int(possibleNumber) else { throw NSError() }

// MARK: -

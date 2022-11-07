import Foundation

// MARK: - Basic Operators
// An operator is a special symbol or phrase that you use to check, change, or combine values

// MARK: - Assignment Operator

// The assignment operator (a = b) initializes or updates the value of a with the value of b:
let b = 10
var a = 5
a = b
// a is now equal to 10

// If the right side of the assignment is a tuple with multiple values,
// its elements can be decomposed into multiple constants or variables at once:
let (x, y) = (1, 2)
// x is equal to 1, and y is equal to 2

// MARK: - Arithmetic Operators
// Addition (+)
// Subtraction (-)
// Multiplication (*)
// Division (/)

1 + 2       // equals 3
5 - 3       // equals 2
2 * 3       // equals 6
10.0 / 2.5  // equals 4.0

// MARK: - Remainder Operator
// The remainder operator (a % b) works out how many multiples of b will fit inside a and returns the value that’s left over (known as the remainder)
// The remainder operator (%) is also known as a modulo operator in other languages

9 % 4    // equals 1
-9 % 4   // equals -1

// MARK: - Unary Minus Operator
// The sign of a numeric value can be toggled using a prefixed -, known as the unary minus operator:
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"

// MARK: - Unary Plus Operator
// The unary plus operator (+) simply returns the value it operates on, without any change:
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6

// MARK: - Compound Assignment Operators
var c = 1
c += 2
// c is now equal to 3
// The expression c += 2 is shorthand for c = c + 2

// MARK: - Comparison Operators
// Equal to (a == b)
// Not equal to (a != b)
// Greater than (a > b)
// Less than (a < b)
// Greater than or equal to (a >= b)
// Less than or equal to (a <= b)

// Swift also provides two identity operators (=== and !==), which you use to test whether two object references both refer to the same object instance

1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 isn't equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 isn't less than or equal to 1

// MARK: - Ternary Conditional Operator
// The ternary conditional operator is a special operator with three parts, which takes the form question ? answer1 : answer2

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90

// MARK: - Nil-Coalescing Operator
// The nil-coalescing operator (a ?? b) unwraps an optional a if it contains a value, or returns a default value b if a is nil
// The expression a is always of an optional type
// The expression b must match the type that’s stored inside a

var d: String?
var e: String = "Value of e"

d != nil ? d! : e
// If the value of a is non-nil, the value of b isn’t evaluated. This is known as short-circuit evaluation

// The example below uses the nil-coalescing operator to choose between a default color name and an optional user-defined color name:
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName isn't nil, so colorNameToUse is set to "green"

// MARK: - Range Operators
// Swift includes several range operators, which are shortcuts for expressing a range of values

// MARK: - Closed Range Operator
// The closed range operator (a...b) defines a range that runs from a to b, and includes the values a and b
// The value of a must not be greater than b

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

// MARK: - Half-Open Range Operator
// The half-open range operator (a..<b) defines a range that runs from a to b, but doesn’t include b
// It’s said to be half-open because it contains its first value, but not its final value
// As with the closed range operator, the value of a must not be greater than b
// If the value of a is equal to b, then the resulting range will be empty

// Half-open ranges are particularly useful when you work with zero-based lists such as arrays,
// where it’s useful to count up to (but not including) the length of the list:
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack

// MARK: - One-Sided Ranges
// The closed range operator has an alternative form for ranges that continue as far as possible in one direction—for example,
// a range that includes all the elements of an array from index 2 to the end of the array
// In these cases, you can omit the value from one side of the range operator

for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian

// The half-open range operator also has a one-sided form that’s written with only its final value
// Just like when you include a value on both sides, the final value isn’t part of the range
for name in names[..<2] {
    print(name)
}
// Anna
// Alex

// MARK: - Logical Operators
// Logical operators modify or combine the Boolean logic values true and false

// MARK: - Logical NOT (!a) Operator
// The logical NOT operator (!a) inverts a Boolean value so that true becomes false, and false becomes true
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"

// MARK: - Logical AND (a && b) Operator
// The logical AND operator (a && b) creates logical expressions where both values must be true for the overall expression to also be true
// If either value is false, the overall expression will also be false
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"

// MARK: - Logical OR (a || b) Operator
// The logical OR operator (a || b) is an infix operator made from two adjacent pipe characters
// Because one value is true, the overall expression also evaluates to true
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"

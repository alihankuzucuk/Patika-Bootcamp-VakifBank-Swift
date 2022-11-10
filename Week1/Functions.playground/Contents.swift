import Foundation

// MARK: - Functions
// Functions are self-contained chunks of code that perform a specific task

// MARK: - Defining and Calling Functions
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
// Prints "Hello, Anna!"
print(greet(person: "Brian"))
// Prints "Hello, Brian!"

// MARK: - Function Parameters and Return Values
// Function parameters and return values are extremely flexible in Swift

// MARK: - Functions Without Parameters
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// Prints "hello, world"

// MARK: - Functions With Multiple Parameters
func sumNumbers(number1: Int, number2: Int) -> Int {
    return number1 + number2;
}

sumNumbers(number1: 5,number2: 3)

// MARK: - Functions without Return Values
func endingExecutionFuncWithParameterless(){
    print("This text will be written")
    
    var checkNumber = 5
    if checkNumber > 4 {
        return
        // The return statement ends execution of function
    }
    
    print("This text will not be written")
}

endingExecutionFuncWithParameterless()

// MARK: - Functions with Multiple Return Values
// You can use a tuple type as the return type for a function to return multiple values as part of one compound return value
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"

// MARK: - Optional Tuple Return Types
// If the tuple type to be returned from a function has the potential to have “no value” for the entire tuple, you can use an optional tuple return type to reflect the fact that the entire tuple can be nil
/**
 NOTE:
 An optional tuple type such as (Int, Int)? is different from a tuple that contains optional types such as (Int?, Int?)
 With an optional tuple type, the entire tuple is optional, not just each individual value within the tuple
 */
func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds2 = minMax2(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds2?.min ?? 0) and max is \(bounds2?.max ?? 0)")
// Prints "min is -6 and max is 109"

// MARK: - Functions With an Implicit Return
// If the entire body of the function is a single expression, the function implicitly returns that expression
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
    // No need to return keyword here cause of function body is a single expression
    // Any function that you write as just one return line can omit the return
}
print(greeting(for: "Dave"))
// Prints "Hello, Dave!"

func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))
// Prints "Hello, Dave!"

// MARK: - Function Argument Labels and Parameter Names
// All parameters must have unique names
// Although it’s possible for multiple parameters to have the same argument label, unique argument labels help make your code more readable
// By default, parameters use their parameter name as their argument label

// MARK: - Specifying Argument Labels
// You write an argument label before the parameter name, separated by a space:
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))
// Prints "Hello Bill! Glad you could visit from Cupertino."

// MARK: - Omitting Argument Labels
// If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)
// If a parameter has an argument label, the argument must be labeled when you call the function

// MARK: - Default Parameter Values
// You can define a default value for any parameter in a function by assigning a value to the parameter after that parameter’s type
// If a default value is defined, you can omit that parameter when calling the function
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12

// MARK: - Variadic Parameters
// A variadic parameter accepts zero or more values of a specified type
// You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called

// A variadic parameter with a name of numbers and a type of Double... is made available within the function’s body as a constant array called numbers of type [Double]
// - EXAMPLE 1
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers

// - EXAMPLE 2
func optionalPrint(maybeStrings: String?...) {
    if maybeStrings.isEmpty {
        print("EMPTY")
    } else {
        for string in maybeStrings {
            if let string = string {
                print(string)
            } else {
                print("nil")
            }

        }
    }
}

var nilString: String?
optionalPrint(maybeStrings: "Goodbye", nilString, "World", "!")

// MARK: - In-Out Parameters
// Function parameters are constants by default
// If you want a function to modify a parameter’s value, and you want those changes to persist after the function call has ended, define that parameter as an in-out parameter instead
// You write an in-out parameter by placing the inout keyword right before a parameter’s type
// An in-out parameter has a value that’s passed in to the function, is modified by the function, and is passed back out of the function to replace the original value

// You can only pass a variable as the argument for an in-out parameter
// You can’t pass a constant or a literal value as the argument, because constants and literals can’t be modified
// You place an ampersand (&) directly before a variable’s name when you pass it as an argument to an in-out parameter, to indicate that it can be modified by the function

// NOTE: In-out parameters can’t have default values, and variadic parameters can’t be marked as inout

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"

// MARK: - Function Types
// Every function has a specific function type, made up of the parameter types and the return type of the function

// (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
// (Int, Int) -> Int
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// () -> Void
func printHelloWorld() {
    print("hello, world")
}

// MARK: - Using Function Types
// You use function types just like any other types in Swift

// You can define a constant or variable to be of a function type and assign an appropriate function to that variable:
var mathFunction: (Int, Int) -> Int = addTwoInts

// You can now call the assigned function with the name mathFunction:
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 5"

// A different function with the same matching type can be assigned to the same variable, in the same way as for nonfunction types:
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
// Prints "Result: 6"

// As with any other type, you can leave it to Swift to infer the function type when you assign a function to a constant or variable:
let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int

// MARK: - Function Types as Parameter Types
// You can use a function type such as (Int, Int) -> Int as a parameter type for another function
// This enables you to leave some aspects of a function’s implementation for the function’s caller to provide when the function is called

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// Prints "Result: 8"

// MARK: - Function Types as Return Types
// You can use a function type as the return type of another function
// You do this by writing a complete function type immediately after the return arrow (->) of the returning function

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// 3...
// 2...
// 1...
// zero!

// MARK: - Nested Functions
func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue2 = -4
let moveNearerToZero2 = chooseStepFunction2(backward: currentValue2 > 0)
// moveNearerToZero2 now refers to the nested stepForward() function
while currentValue2 != 0 {
    print("\(currentValue2)... ")
    currentValue2 = moveNearerToZero2(currentValue2)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!

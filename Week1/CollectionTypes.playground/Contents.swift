import Foundation

// MARK: - Collection Types
// You can reveal CollectionTypes.png to see what is the difference between collection types

// MARK: - Arrays
// An array stores values of the same type in an ordered list
// The same value can appear in an array multiple times at different positions

// MARK: - Creating an Empty Array
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")
// Prints "someInts is of type [Int] with 0 items."

// Note that the type of the someInts variable is inferred to be [Int] from the type of the initializer

/**
 Alternatively, if the context already provides type information, such as a function argument or an already typed variable or constant, you can create an empty array with an empty array literal, which is written as []
 */
someInts.append(3)
// someInts now contains 1 value of type Int
someInts = []
// someInts is now an empty array, but is still of type [Int]

// MARK: - Creating an Array with a Default Value
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]

// MARK: - Creating an Array by Adding Two Arrays Together
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

// MARK: - Creating an Array with an Array Literal
// You can also initialize an array with an array literal, which is a shorthand way to write one or more values as an array collection
var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList has been initialized with two initial items

var shoppingList2 = ["Egg", "Milk"]
// Inferred as [String]

// MARK: - Accessing and Modifying an Array
print("The shopping list contains \(shoppingList.count) items.")
// Prints "The shopping list contains 2 items."

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}
// Prints "The shopping list isn't empty."

// You can add a new item to the end of an array by calling the array’s append(_:) method:
shoppingList.append("Flour")
// shoppingList now contains 3 items, and someone is making pancakes

// Alternatively, append an array of one or more compatible items with the addition assignment operator (+=):
shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items

// Retrieve a value from the array by using subscript syntax, passing the index of the value you want to retrieve within square brackets immediately after the name of the array:
var firstItem = shoppingList[0]
// firstItem is equal to "Eggs"

// NOTE: The first item in the array has an index of 0, not 1. Arrays in Swift are always zero-indexed

// You can use subscript syntax to change an existing value at a given index:
shoppingList[0] = "Six eggs"
// the first item in the list is now equal to "Six eggs" rather than "Eggs"

/**
 You can also use subscript syntax to change a range of values at once, even if the replacement set of values has a different length than the range you are replacing
 The following example replaces "Chocolate Spread", "Cheese", and "Butter" with "Bananas" and "Apples":
 */
shoppingList
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList

// To insert an item into the array at a specified index, call the array’s insert(_:at:) method:
shoppingList.insert("Maple Syrup", at: 0)
// shoppingList now contains 7 items
// "Maple Syrup" is now the first item in the list

// Similarly, you remove an item from the array with the remove(at:) method
let mapleSyrup = shoppingList.remove(at: 0)
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string
// Any gaps in an array are closed when an item is removed, and so the value at index 0 is once again equal to "Six eggs"

// MARK: - Iterating Over an Array
// You can iterate over the entire set of values in an array with the for-in loop:
for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas

// MARK: - Nested Array
let nestedArray: [[Int]] = [[1], [2], [3, 8, 6]]

// MARK: - Sets
// A set stores distinct values of the same type in a collection with no defined ordering
// You can use a set instead of an array when the order of items isn’t important, or when you need to ensure that an item only appears once
// Swift’s Set type is bridged to Foundation’s NSSet class

/**
 Hash Values for Set Types
 A type must be hashable in order to be stored in a set—that is, the type must provide a way to compute a hash value for itself
 A hash value is an Int value that’s the same for all objects that compare equally, such that if a == b, the hash value of a is equal to the hash value of b
 
 All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default, and can be used as set value types or dictionary key types
 Enumeration case values without associated values (as described in Enumerations) are also hashable by default
 */

// MARK: - Creating and Initializing an Empty Set
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// Prints "letters is of type Set<Character> with 0 items."

letters.insert("a")
// letters now contains 1 value of type Character
letters = []
// letters is now an empty set, but is still of type Set<Character>

// MARK: - Creating a Set with an Array Literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres has been initialized with three initial items

// NOTE: A set type can’t be inferred from an array literal alone, so the type Set must be explicitly declared
// However, because of Swift’s type inference, you don’t have to write the type of the set’s elements if you’re initializing it with an array literal that contains values of just one type

var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]

// MARK: - Accessing and Modifying a Set

// - EXAMPLE 1
print("I have \(favoriteGenres.count) favorite music genres.")
// Prints "I have 3 favorite music genres."

// - EXAMPLE 2
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// Prints "I have particular music preferences."

// - EXAMPLE 3
favoriteGenres.insert("Jazz")
// favoriteGenres now contains 4 items

// - EXAMPLE 4
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// Prints "Rock? I'm over it."

// - EXAMPLE 5
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
// Prints "It's too funky in here."

// MARK: - Iterating Over a Set

// - EXAMPLE 1
for genre in favoriteGenres {
    print("\(genre)")
}
// Classical
// Jazz
// Hip hop

// - EXAMPLE 2
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz

// MARK: - Performing Set Operations
/**
 You can efficiently perform fundamental set operations, such as combining two sets together, determining which values two sets have in common, or determining whether two sets contain all, some, or none of the same values
 */

// MARK: - Fundamental Set Operations
// The illustration below depicts two sets—a and b—with the results of various set operations represented by the shaded regions
// ../Documents/Week1/CollectionTypes/collection_types-set-venn_diagram.png

/**
 Use the intersection(_:) method to create a new set with only the values common to both sets
 Use the symmetricDifference(_:) method to create a new set with values in either set, but not both
 Use the union(_:) method to create a new set with all of the values in both sets
 Use the subtracting(_:) method to create a new set with values not in the specified set
 */

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

// MARK: - Set Membership and Equality
/**
 The illustration below depicts three sets—a, b and c—with overlapping regions representing elements shared among sets
 Set a is a superset of set b, because a contains all elements in b
 Conversely, set b is a subset of set a, because all elements in b are also contained by a
 Set b and set c are disjoint with one another, because they share no elements in common
 */
// ../Documents/Week1/CollectionTypes/collection_types-set-euler_diagram.png

/**
 Use the “is equal” operator (==) to determine whether two sets contain all of the same values
 Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set
 Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set
 Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set
 Use the isDisjoint(with:) method to determine whether two sets have no values in common
 */

let houseAnimals: Set = ["dog", "cat"]
let farmAnimals: Set = ["cow", "chicken", "sheep", "dog", "cat"]
let cityAnimals: Set = ["crow", "mouse"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true

// MARK: - Dictionaries
/**
 A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering
 Each value is associated with a unique key, which acts as an identifier for that value within the dictionary
 Unlike items in an array, items in a dictionary don’t have a specified order
 You use a dictionary when you need to look up values based on their identifier, in much the same way that a real-world dictionary is used to look up the definition for a particular word
 */

// NOTE: Swift’s Dictionary type is bridged to Foundation’s NSDictionary class
// NOTE: A dictionary Key type must conform to the Hashable protocol, like a set’s value type

// MARK: - Creating an Empty Dictionary

//As with arrays, you can create an empty Dictionary of a certain type by using initializer syntax:
var namesOfIntegers: [Int: String] = [:]
// namesOfIntegers is an empty [Int: String] dictionary

// If the context already provides type information, you can create an empty dictionary with an empty dictionary literal, which is written as [:] (a colon inside a pair of square brackets):
namesOfIntegers[16] = "sixteen"
// namesOfIntegers now contains 1 key-value pair
namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]

// MARK: - Creating a Dictionary with a Dictionary Literal
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// MARK: - Accessing and Modifying a Dictionary
// You access and modify a dictionary through its methods and properties, or by using subscript syntax
print("The airports dictionary contains \(airports.count) items.")
// Prints "The airports dictionary contains 2 items."

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary isn't empty.")
}
// Prints "The airports dictionary isn't empty."

airports["LHR"] = "London"
// the airports dictionary now contains 3 items

airports["LHR"] = "London Heathrow"
// the value for "LHR" has been changed to "London Heathrow"

// Like the subscript examples above, the updateValue(_:forKey:) method sets a value for a key if none exists, or updates the value if that key already exists
// Unlike a subscript, however, the updateValue(_:forKey:) method returns the old value after performing an update

// This optional value contains the old value for that key if one existed before the update, or nil if no value existed:
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// Prints "The old value for DUB was Dublin."

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}
// Prints "The name of the airport is Dublin Airport."

// You can use subscript syntax to remove a key-value pair from a dictionary by assigning a value of nil for that key:
airports["APL"] = "Apple International"
// "Apple International" isn't the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary

// Alternatively, remove a key-value pair from a dictionary with the removeValue(forKey:) method
// This method removes the key-value pair if it exists and returns the removed value, or returns nil if no value existed:
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}
// Prints "The removed airport's name is Dublin Airport."

// MARK: - Iterating Over a Dictionary

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// LHR: London Heathrow
// YYZ: Toronto Pearson

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: YYZ

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: London Heathrow
// Airport name: Toronto Pearson

// If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property:
let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]

let airportNames = [String](airports.values)
// airportNames is ["London Heathrow", "Toronto Pearson"]

// NOTE: Swift’s Dictionary type doesn’t have a defined ordering. To iterate over the keys or values of a dictionary in a specific order, use the sorted() method on its keys or values property

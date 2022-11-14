import Foundation

// MARK: - Methods
// Methods are functions that are associated with a particular type
// Classes, structures, and enumerations can all define instance methods, which encapsulate specific tasks and functionality for working with an instance of a given type
// Classes, structures, and enumerations can also define type methods, which are associated with the type itself

// MARK: - Instance Methods
// Instance methods are functions that belong to instances of a particular class, structure, or enumeration
// They support the functionality of those instances, either by providing ways to access and modify instance properties, or by providing functionality related to the instance’s purpose

// An instance method has implicit access to all other instance methods and properties of that type
// An instance method can be called only on a specific instance of the type it belongs to
// It can’t be called in isolation without an existing instance

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
counter.increment(by: 5)
// the counter's value is now 6
counter.reset()
// the counter's value is now 0

// MARK: - The self Property
// Every instance of a type has an implicit property called self, which is exactly equivalent to the instance itself
// You use the self property to refer to the current instance within its own instance methods

extension Counter {
    func incrementBy2() {
        self.count += 2
    }
}

counter.incrementBy2()

/**
 You don’t need to write self in your code very often
 If you don’t explicitly write self, Swift assumes that you are referring to a property or method of the current instance whenever you use a known property or method name within a method
 */
// Here, self disambiguates between a method parameter called x and an instance property that’s also called x:
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// Prints "This point is to the right of the line where x == 1.0"

// Without the self prefix, Swift would assume that both uses of x referred to the method parameter called x

// MARK: - Modifying Value Types from Within Instance Methods
// Structures and enumerations are value types
// By default, the properties of a value type can’t be modified from within its instance methods

/**
 However, if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method
 The method can then mutate (that is, change) its properties from within the method, and any changes that it makes are written back to the original structure when the method ends
 The method can also assign a completely new instance to its implicit self property, and this new instance will replace the existing one when the method ends
 */

struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint2.x), \(somePoint2.y))")
// Prints "The point is now at (3.0, 4.0)"

/**
 NOTE:
 You can’t call a mutating method on a constant of structure type, because its properties can’t be changed, even if they’re variable properties
 */
let fixedPoint = Point2(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0) // ERROR
// this will report an error

// MARK: - Assigning to self Within a Mutating Method
// Mutating methods can assign an entirely new instance to the implicit self property
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to .high
ovenLight.next()
// ovenLight is now equal to .off

// MARK: - Type Methods
// Instance methods, as described above, are methods that you call on an instance of a particular type
// You can also define methods that are called on the type itself
// These kinds of methods are called type methods
// You indicate type methods by writing the static keyword before the method’s func keyword
// Classes can use the class keyword instead, to allow subclasses to override the superclass’s implementation of that method

// You call type methods on the type, not on an instance of that type
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()

/**
 NOTE:
 Within the body of a type method, the implicit self property refers to the type itself, rather than an instance of that type
 This means that you can use self to disambiguate between type properties and type method parameters, just as you do for instance properties and instance method parameters
 */

/**
 More generally, any unqualified method and property names that you use within the body of a type method will refer to other type-level methods and properties
 A type method can call another type method with the other method’s name, without needing to prefix it with the type name
 Similarly, type methods on structures and enumerations can access type properties by using the type property’s name without a type name prefix
 */

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// Prints "highest unlocked level is now 2"

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 hasn't yet been unlocked")
}
// Prints "level 6 hasn't yet been unlocked"

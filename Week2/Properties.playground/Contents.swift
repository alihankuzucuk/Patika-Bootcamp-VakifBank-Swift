import Foundation

// MARK: - Properties
// Properties associate values with a particular class, structure, or enumeration
// Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value
// Computed properties are provided by classes, structures, and enumerations
// Stored properties are provided only by classes and structures

// Stored and computed properties are usually associated with instances of a particular type
// However, properties can also be associated with the type itself (Such properties are known as type properties)

// In addition, you can define property observers to monitor changes in a property’s value, which you can respond to with custom actions
// Property observers can be added to stored properties you define yourself, and also to properties that a subclass inherits from its superclass

// MARK: - Stored Properties
// In its simplest form, a stored property is a constant or variable that’s stored as part of an instance of a particular class or structure
// Stored properties can be either variable stored properties (introduced by the var keyword) or constant stored properties (introduced by the let keyword)

// The example below defines a structure called FixedLengthRange, which describes a range of integers whose range length can’t be changed after it’s created:
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// The range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// The range now represents integer values 6, 7, and 8

// MARK: - Stored Properties of Constant Structure Instances
// If you create an instance of a structure and assign that instance to a constant, you can’t modify the instance’s properties, even if they were declared as variable properties:
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// This range represents integer values 0, 1, 2, and 3
rangeOfFourItems.firstValue = 6 // ERROR
// This will report an error, even though firstValue is a variable property

// Because rangeOfFourItems is declared as a constant (with the let keyword), it isn’t possible to change its firstValue property, even though firstValue is a variable property

// NOTE: This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties
// NOTE: The same isn’t true for classes, which are reference types. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties

// MARK: - Lazy Stored Properties
// A lazy stored property is a property whose initial value isn’t calculated until the first time it’s used
// You indicate a lazy stored property by writing the lazy modifier before its declaration

/**
 NOTE:
 You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initialization completes
 Constant properties must always have a value before initialization completes, and therefore can’t be declared as lazy
 */

// Lazy properties are useful when the initial value for a property is dependent on outside factors whose values aren’t known until after an instance’s initialization is complete
// Lazy properties are also useful when the initial value for a property requires complex or computationally expensive setup that shouldn’t be performed unless or until it’s needed

class DataImporter {
    /**
     DataImporter is a class to import data from an external file
     The class is assumed to take a nontrivial amount of time to initialize
     */
    var filename = "data.txt"
    // The DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
    // The DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// The DataImporter instance for the importer property hasn't yet been created

// DataManager doesn’t create a new DataImporter instance when the DataManager itself is created. Instead, it makes more sense to create the DataImporter instance if and when it’s first used
// Because it’s marked with the lazy modifier, the DataImporter instance for the importer property is only created when the importer property is first accessed, such as when its filename property is queried:
print(manager.importer.filename)
// the DataImporter instance for the importer property has now been created
// Prints "data.txt"

/**
 If a property marked with the lazy modifier is accessed by multiple threads simultaneously and the property hasn’t yet been initialized, there’s no guarantee that the property will be initialized only once
 */

// MARK: - Computed Properties
/**
 In addition to stored properties, classes, structures, and enumerations can define computed properties, which don’t actually store a value
 Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly
 */
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
// initialSquareCenter is at (5.0, 5.0)
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)"

// MARK: - Read-Only Computed Properties
// A computed property with a getter but no setter is known as a read-only computed property
// A read-only computed property always returns a value, and can be accessed through dot syntax, but can’t be set to a different value

/**
 You must declare computed properties—including read-only computed properties—as variable properties with the var keyword, because their value isn’t fixed
 The let keyword is only used for constant properties, to indicate that their values can’t be changed once they’re set as part of instance initialization
 */

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("The volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// Prints "The volume of fourByFiveByTwo is 40.0"

// MARK: - Property Observers
// Property observers observe and respond to changes in a property’s value
// Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value

/**
 You can add property observers in the following places:
 - Stored properties that you define
 - Stored properties that you inherit
 - Computed properties that you inherit
 */

/**
 You have the option to define either or both of these observers on a property:
 - willSet is called just before the value is stored
 - didSet is called immediately after the new value is stored
 */

/**
 If you implement a willSet observer, it’s passed the new property value as a constant parameter
 You can specify a name for this parameter as part of your willSet implementation
 If you don’t write the parameter name and parentheses within your implementation, the parameter is made available with a default parameter name of newValue
 */

/**
 If you implement a didSet observer, it’s passed a constant parameter containing the old property value
 You can name the parameter or use the default parameter name of oldValue
 If you assign a value to a property within its own didSet observer, the new value that you assign replaces the one that was just set
 */

/**
 NOTE:
 The willSet and didSet observers of superclass properties are called when a property is set in a subclass initializer, after the superclass initializer has been called
 They aren’t called while a class is setting its own properties, before the superclass initializer has been called
 */

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps

/**
 NOTE:
 If you pass a property that has observers to a function as an in-out parameter, the willSet and didSet observers are always called
 This is because of the copy-in copy-out memory model for in-out parameters: The value is always written back to the property at the end of the function
 */

// MARK: - Property Wrappers
// A property wrapper adds a layer of separation between code that manages how a property is stored and the code that defines a property

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

/**
 The declaration for number in the example above marks the variable as private, which ensures number is used only in the implementation of TwelveOrLess
 Code that’s written anywhere else accesses the value using the getter and setter for wrappedValue, and can’t use number directly
 */

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// Prints "0" (which height's and width's initial value)

rectangle.height = 10
print(rectangle.height)
// Prints "10"

rectangle.height = 24
print(rectangle.height)
// Prints "12"

// MARK: - Setting Initial Values for Wrapped Properties
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

// - EXAMPLE 1
// When you apply a wrapper to a property and you don’t specify an initial value, Swift uses the init() initializer to set up the wrapper
struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)
// Prints "0 0"

// - EXAMPLE 2
// When you specify an initial value for the property, Swift uses the init(wrappedValue:) initializer to set up the wrapper
struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)
// Prints "1 1"

// - EXAMPLE 3
// When you write arguments in parentheses after the custom attribute, Swift uses the initializer that accepts those arguments to set up the wrapper
struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)
// Prints "2 3"

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)
// Prints "5 4"

// - EXAMPLE 4
// When you include property wrapper arguments, you can also specify an initial value using assignment
// Swift treats the assignment like a wrappedValue argument and uses the initializer that accepts the arguments you include
struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)
// Prints "1"

mixedRectangle.height = 20
print(mixedRectangle.height)
// Prints "12"

// MARK: - Projecting a Value From a Property Wrapper
// In addition to the wrapped value, a property wrapper can expose additional functionality by defining a projected value
// The name of the projected value is the same as the wrapped value, except it begins with a dollar sign ($)
// Because your code can’t define properties that start with $ the projected value never interferes with properties you define
// A property wrapper can return a value of any type as its projected value

// - EXAMPLE 1
@propertyWrapper
struct SmallNumber2 {
    private var number: Int
    private(set) var projectedValue: Bool

    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }

    init() {
        self.number = 0
        self.projectedValue = false
    }
}
struct SomeStructure {
    @SmallNumber2 var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)
// Prints "false"

someStructure.someNumber = 55
print(someStructure.$someNumber)
// Prints "true"

// - EXAMPLE 2
enum Size2 {
    case small, large
}

struct SizedRectangle {
    @SmallNumber2 var height: Int
    @SmallNumber2 var width: Int

    mutating func resize(to size: Size2) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height && $width
    }
}

var sizedRect = SizedRectangle()
print(sizedRect.resize(to: Size2.small))
// Prints "false"

print(sizedRect.resize(to: Size2.large))
// Prints "true"

// MARK: - Global and Local Variables
// Global variables are variables that are defined outside of any function, method, closure, or type context
// Local variables are variables that are defined within a function, method, or closure context

// However, you can also define computed variables and define observers for stored variables, in either a global or local scope
// Computed variables calculate their value, rather than storing it, and they’re written in the same way as computed properties

/**
 NOTE:
 Global constants and variables are always computed lazily, in a similar manner to Lazy Stored Properties
 Unlike lazy stored properties, global constants and variables don’t need to be marked with the lazy modifier
 
 Local constants and variables are never computed lazily
 */

// You can apply a property wrapper to a local stored variable, but not to a global variable or a computed variable

// MARK: - Type Properties
// Instance properties are properties that belong to an instance of a particular type
// Every time you create a new instance of that type, it has its own set of property values, separate from any other instance

// You can also define properties that belong to the type itself, not to any one instance of that type
// There will only ever be one copy of these properties, no matter how many instances of that type you create
// These kinds of properties are called type properties

// Stored type properties can be variables or constants

// Computed type properties are always declared as variable properties, in the same way as computed instance properties

/**
 NOTE:
 Unlike stored instance properties, you must always give stored type properties a default value
 This is because the type itself doesn’t have an initializer that can assign a value to a stored type property at initialization time
 
 Stored type properties are lazily initialized on their first access
 They’re guaranteed to be initialized only once, even when accessed by multiple threads simultaneously, and they don’t need to be marked with the lazy modifier
 */

// MARK: - Type Property Syntax
// You define type properties with the static keyword
// For computed type properties for class types, you can use the class keyword instead to allow subclasses to override the superclass’s implementation

// - EXAMPLE 1
struct SomeStructure2 {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

// - EXAMPLE 2
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
// Prints "7"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "7"

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
// Prints "10"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "10"

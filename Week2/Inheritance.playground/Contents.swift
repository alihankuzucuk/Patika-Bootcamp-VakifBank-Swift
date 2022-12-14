import Foundation

// MARK: - Inheritance
// A class can inherit methods, properties, and other characteristics from another class
// When one class inherits from another, the inheriting class is known as a subclass, and the class it inherits from is known as its superclass

/**
 Classes in Swift can call and access methods, properties, and subscripts belonging to their superclass and can provide their own overriding versions of those methods, properties, and subscripts to refine or modify their behavior
 Swift helps to ensure your overrides are correct by checking that the override definition has a matching superclass definition
 
 Classes can also add property observers to inherited properties in order to be notified when the value of a property changes
 Property observers can be added to any property, regardless of whether it was originally defined as a stored or computed property
 */

// MARK: - Defining a Base Class
// Any class that doesn’t inherit from another class is known as a base class
// Swift classes don’t inherit from a universal base class
// Classes you define without specifying a superclass automatically become base classes for you to build upon

class Vehicle {
    var currentSpeed = 0.0
    var description: String { // Read-Only Computed String Property
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

let someVehicle = Vehicle()

print("Vehicle: \(someVehicle.description)")
// Vehicle: traveling at 0.0 miles per hour

// MARK: - Subclassing
// Subclassing is the act of basing a new class on an existing class
// The subclass inherits characteristics from the existing class, which you can then refine
// You can also add new characteristics to the subclass

class Bicycle: Vehicle { // Bicycle is subclass and Vehicle is superclass
    var hasBasket = false
}

// The new Bicycle class automatically gains all of the characteristics of Vehicle, such as its currentSpeed and description properties and its makeNoise() method

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
// Bicycle: traveling at 15.0 miles per hour

// Subclasses can themselves be subclassed

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")
// Tandem: traveling at 22.0 miles per hour

// MARK: - Overriding
// A subclass can provide its own custom implementation of an instance method, type method, instance property, type property, or subscript that it would otherwise inherit from a superclass
// To override a characteristic that would otherwise be inherited, you prefix your overriding definition with the override keyword
// Doing so clarifies that you intend to provide an override and haven’t provided a matching definition by mistake

// The override keyword also prompts the Swift compiler to check that your overriding class’s superclass (or one of its parents) has a declaration that matches the one you provided for the override

// MARK: - Accessing Superclass Methods, Properties, and Subscripts
// When you provide a method, property, or subscript override for a subclass, it’s sometimes useful to use the existing superclass implementation as part of your override

/**
 Where this is appropriate, you access the superclass version of a method, property, or subscript by using the super prefix:
 - An overridden method named someMethod() can call the superclass version of someMethod() by calling super.someMethod() within the overriding method implementation
 - An overridden property called someProperty can access the superclass version of someProperty as super.someProperty within the overriding getter or setter implementation
 - An overridden subscript for someIndex can access the superclass version of the same subscript as super[someIndex] from within the overriding subscript implementation
 */

// MARK: - Overriding Methods
// You can override an inherited instance or type method to provide a tailored or alternative implementation of the method within your subclass
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()
// Prints "Choo Choo"

// MARK: - Overriding Properties
/**
 You can override an inherited instance or type property to provide your own custom getter and setter for that property, or to add property observers to enable the overriding property to observe when the underlying property value changes
 */

// MARK: - Overriding Property Getters and Setters
// You can provide a custom getter (and setter, if appropriate) to override any inherited property, regardless of whether the inherited property is implemented as a stored or computed property at source
// The stored or computed nature of an inherited property isn’t known by a subclass - it only knows that the inherited property has a certain name and type
// You must always state both the name and the type of the property you are overriding, to enable the compiler to check that your override matches a superclass property with the same name and type

// You can present an inherited read-only property as a read-write property by providing both a getter and a setter in your subclass property override
// You can’t, however, present an inherited read-write property as a read-only property

/**
 NOTE:
 If you provide a setter as part of a property override, you must also provide a getter for that override
 If you don’t want to modify the inherited property’s value within the overriding getter, you can simply pass through the inherited value by returning super.someProperty from the getter, where someProperty is the name of the property you are overriding
 */

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

// The override of the description property starts by calling super.description, which returns the Vehicle class’s description property

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// Car: traveling at 25.0 miles per hour in gear 3

// MARK: - Overriding Property Observers
// You can use property overriding to add property observers to an inherited property
// This enables you to be notified when the value of an inherited property changes, regardless of how that property was originally implemented

/**
 You can’t add property observers to inherited constant stored properties or inherited read-only computed properties
 The value of these properties can’t be set, and so it isn’t appropriate to provide a willSet or didSet implementation as part of an override
 
 Note also that you can’t provide both an overriding setter and an overriding property observer for the same property
 If you want to observe changes to a property’s value, and you are already providing a custom setter for that property, you can simply observe any value changes from within the custom setter
 */

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4

// MARK: - Preventing Overrides
/**
 You can prevent a method, property, or subscript from being overridden by marking it as final
 Do this by writing the final modifier before the method, property, or subscript’s introducer keyword (such as final var, final func, final class func, and final subscript)
 
 Any attempt to override a final method, property, or subscript in a subclass is reported as a compile-time error
 Methods, properties, or subscripts that you add to a class in an extension can also be marked as final within the extension’s definition
 
 You can mark an entire class as final by writing the final modifier before the class keyword in its class definition (final class)
 Any attempt to subclass a final class is reported as a compile-time error
 */

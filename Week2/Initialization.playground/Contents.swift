import UIKit

// MARK: - Initialization
// Initialization is the process of preparing an instance of a class, structure, or enumeration for use
// This process involves setting an initial value for each stored property on that instance and performing any other setup or initialization that’s required before the new instance is ready for use

// You implement this initialization process by defining initializers, which are like special methods that can be called to create a new instance of a particular type

// Unlike Objective-C initializers, Swift initializers don’t return a value
// Their primary role is to ensure that new instances of a type are correctly initialized before they’re used for the first time

// Instances of class types can also implement a deinitializer, which performs any custom cleanup just before an instance of that class is deallocated

// MARK: - Setting Initial Values for Stored Properties
// Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created
// Stored properties can’t be left in an indeterminate state

/**
 NOTE:
 When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set directly, without calling any property observers
 */

// MARK: - Initializers
// Initializers are called to create a new instance of a particular type

// EXAMPLE:
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// Prints "The default temperature is 32.0° Fahrenheit"

// MARK: - Default Property Values
// You can set the initial value of a stored property from within an initializer, as shown above
// Alternatively, specify a default property value as part of the property’s declaration
// You specify a default property value by assigning an initial value to the property when it’s defined

/**
 NOTE:
 If a property always takes the same initial value, provide a default value rather than setting a value within an initializer
 The end result is the same, but the default value ties the property’s initialization more closely to its declaration
 It makes for shorter, clearer initializers and enables you to infer the type of the property from its default value
 */

// EXAMPLE:
struct Fahrenheit2 {
    var temperature = 32.0
}

// MARK: - Customizing Initialization
// You can customize the initialization process with input parameters and optional property types, or by assigning constant properties during initialization

// MARK: - Initialization Parameters
// You can provide initialization parameters as part of an initializer’s definition, to define the types and names of values that customize the initialization process

// EXAMPLE:
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0

// MARK: - Parameter Names and Argument Labels
// As with function and method parameters, initialization parameters can have both a parameter name for use within the initializer’s body and an argument label for use when calling the initializer

// However, initializers don’t have an identifying function name before their parentheses in the way that functions and methods do
// Therefore, the names and types of an initializer’s parameters play a particularly important role in identifying which initializer should be called
// Because of this, Swift provides an automatic argument label for every parameter in an initializer if you don’t provide one

// The following example defines a structure called Color, with three constant properties called red, green, and blue
// These properties store a value between 0.0 and 1.0 to indicate the amount of red, green, and blue in the color
// EXAMPLE:
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

// Both initializers can be used to create a new Color instance, by providing named values for each initializer parameter:
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

/**
 NOTE:
 It isn’t possible to call these initializers without using argument labels
 Argument labels must always be used in an initializer if they’re defined, and omitting them is a compile-time error:
 */
let veryGreen = Color(0.0, 1.0, 0.0) // ERROR
// This reports a compile-time error - argument labels are required

// MARK: - Initializer Parameters Without Argument Labels
// If you don’t want to use an argument label for an initializer parameter, write an underscore (_) instead of an explicit argument label for that parameter to override the default behavior

// EXAMPLE:
struct Celsius2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius2(37.0)
// bodyTemperature.temperatureInCelsius is 37.0

// The initializer call Celsius(37.0) is clear in its intent without the need for an argument label
// It’s therefore appropriate to write this initializer as init(_ celsius: Double) so that it can be called by providing an unnamed Double value

// MARK: - Optional Property Types
// If your custom type has a stored property that’s logically allowed to have “no value”—perhaps because its value can’t be set during initialization, or because it’s allowed to have “no value” at some later point—declare the property with an optional type
// Properties of optional type are automatically initialized with a value of nil, indicating that the property is deliberately intended to have “no value yet” during initialization

// EXAMPLE:
class SurveyQuestion {
    var text: String
    var response: String? // Optional Property
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."

// MARK: - Assigning Constant Properties During Initialization
// You can assign a value to a constant property at any point during initialization, as long as it’s set to a definite value by the time initialization finishes
// Once a constant property is assigned a value, it can’t be further modified

/**
 NOTE:
 For class instances, a constant property can be modified during initialization only by the class that introduces it
 It can’t be modified by a subclass
 */

// EXAMPLE:
class SurveyQuestion2 {
    let text: String // Constant Property
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask()
// Prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"

// MARK: - Default Initializers
// Swift provides a default initializer for any structure or class that provides default values for all of its properties and doesn’t provide at least one initializer itself
// The default initializer simply creates a new instance with all of its properties set to their default values

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

// Because all properties of the ShoppingListItem class have default values, and because it’s a base class with no superclass, ShoppingListItem automatically gains a default initializer implementation that creates a new instance with all of its properties set to their default values

// MARK: - Memberwise Initializers for Structure Types
// Structure types automatically receive a memberwise initializer if they don’t define any of their own custom initializers
// Unlike a default initializer, the structure receives a memberwise initializer even if it has stored properties that don’t have default values

// The memberwise initializer is a shorthand way to initialize the member properties of new structure instances
// Initial values for the properties of the new instance can be passed to the memberwise initializer by name

// EXAMPLE:
struct Size {
    var width = 0.0, height = 0.0 // Both properties are inferred to be of type Double by assigning a default value of 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

// The Size structure automatically receives an init(width:height:) memberwise initializer, which you can use to initialize a new Size instance

// When you call a memberwise initializer, you can omit values for any properties that have default values
// In the example above, the Size structure has a default value for both its height and width properties
// You can omit either property or both properties, and the initializer uses the default value for anything you omit

// EXAMPLE:
let zeroByTwo = Size(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)
// Prints "0.0 2.0"

let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height)
// Prints "0.0 0.0"

// MARK: - Initializer Delegation for Value Types
// Initializers can call other initializers to perform part of an instance’s initialization
// This process, known as initializer delegation, avoids duplicating code across multiple initializers

// The rules for how initializer delegation works, and for what forms of delegation are allowed, are different for value types and class types
// Value types (structures and enumerations) don’t support inheritance, and so their initializer delegation process is relatively simple, because they can only delegate to another initializer that they provide themselves
// Classes, however, can inherit from other classes
// This means that classes have additional responsibilities for ensuring that all stored properties they inherit are assigned a suitable value during initialization
// These responsibilities are described in Class Inheritance and Initialization below

/**
 NOTE:
 For value types, you use self.init to refer to other initializers from the same value type when writing your own custom initializers
 You can call self.init only from within an initializer
 */

/**
 NOTE:
 If you define a custom initializer for a value type, you will no longer have access to the default initializer (or the memberwise initializer, if it’s a structure) for that type
 
 This constraint prevents a situation in which additional essential setup provided in a more complex initializer is accidentally circumvented by someone using one of the automatic initializers
 */

/**
 NOTE:
 If you want your custom value type to be initializable with the default initializer and memberwise initializer, and also with your own custom initializers, write your custom initializers in an extension rather than as part of the value type’s original implementation
 */

// EXAMPLE:
struct Size2 {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size2 = Size2()
    init() {} // is functionally the same as the default initializer that the structure would have received if it didn’t have its own custom initializers
    init(origin: Point, size2: Size2) { // is functionally the same as the memberwise initializer that the structure would have received if it didn’t have its own custom initializers
        self.origin = origin
        self.size2 = size2
    }
    init(center: Point, size2: Size2) { // it’s more convenient (and clearer in intent)
        let originX = center.x - (size2.width / 2)
        let originY = center.y - (size2.height / 2)
        self.init(origin: Point(x: originX, y: originY), size2: size2)
    }
}

// 1st Initializer
let basicRect = Rect()
// basicRect's origin is (0.0, 0.0) and its size2 is (0.0, 0.0)

// 2nd Initializer
let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                      size2: Size2(width: 5.0, height: 5.0))
// originRect's origin is (2.0, 2.0) and its size2 is (5.0, 5.0)

// 3rd Initializer
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size2: Size2(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size2 is (3.0, 3.0)

// MARK: - Class Inheritance and Initialization
// All of a class’s stored properties—including any properties the class inherits from its superclass—must be assigned an initial value during initialization

// Swift defines two kinds of initializers for class types to help ensure all stored properties receive an initial value
// These are known as designated initializers and convenience initializers

// MARK: - Designated Initializers and Convenience Initializers
// Designated initializers are the primary initializers for a class
// A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain

// Classes tend to have very few designated initializers, and it’s quite common for a class to have only one
// Designated initializers are “funnel” points through which initialization takes place, and through which the initialization process continues up the superclass chain

// Every class must have at least one designated initializer
// In some cases, this requirement is satisfied by inheriting one or more designated initializers from a superclass, as described in Automatic Initializer Inheritance below

// Convenience initializers are secondary, supporting initializers for a class
// You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values
// You can also define a convenience initializer to create an instance of that class for a specific use case or input value type

// You don’t have to provide convenience initializers if your class doesn’t require them
// Create convenience initializers whenever a shortcut to a common initialization pattern will save time or make initialization of the class clearer in intent

// MARK: - Syntax for Designated and Convenience Initializers
// Designated initializers for classes are written in the same way as simple initializers for value types
// Convenience initializers are written in the same style, but with the convenience modifier placed before the init keyword, separated by a space

// MARK: - Initializer Delegation for Class Types
// To simplify the relationships between designated and convenience initializers, Swift applies the following three rules for delegation calls between initializers:

/**
 RULE 1:
 A designated initializer must call a designated initializer from its immediate superclass
 
 RULE 2:
 A convenience initializer must call another initializer from the same class
 
 RULE 3:
 A convenience initializer must ultimately call a designated initializer
 
 A simple way to remember this is:
 1 - Designated initializers must always delegate up
 2 - Convenience initializers must always delegate across
 
 These rules are illustrated in the figure below:
 ../Documents/Week2/Initialization/initializer_delegation-1.png
 ../Documents/Week2/Initialization/initializer_delegation-2.png
 */

// MARK: - Two-Phase Initialization
// Class initialization in Swift is a two-phase process
// In the first phase, each stored property is assigned an initial value by the class that introduced it
// Once the initial state for every stored property has been determined, the second phase begins, and each class is given the opportunity to customize its stored properties further before the new instance is considered ready for use

// The use of a two-phase initialization process makes initialization safe, while still giving complete flexibility to each class in a class hierarchy
// Two-phase initialization prevents property values from being accessed before they’re initialized, and prevents property values from being set to a different value by another initializer unexpectedly

// Swift’s compiler performs four helpful safety-checks to make sure that two-phase initialization is completed without error:
/**
 1 - Safety Check 1
 A designated initializer must ensure that all of the properties introduced by its class are initialized before it delegates up to a superclass initializer
 
 As mentioned above, the memory for an object is only considered fully initialized once the initial state of all of its stored properties is known
 In order for this rule to be satisfied, a designated initializer must make sure that all of its own properties are initialized before it hands off up the chain
 
 2 - Safety Check 2
 A designated initializer must delegate up to a superclass initializer before assigning a value to an inherited property
 If it doesn’t, the new value the designated initializer assigns will be overwritten by the superclass as part of its own initialization
 
 3 - Safety Check 3
 A convenience initializer must delegate to another initializer before assigning a value to any property (including properties defined by the same class)
 If it doesn’t, the new value the convenience initializer assigns will be overwritten by its own class’s designated initializer
 
 4 - Safety Check 4
 An initializer can’t call any instance methods, read the values of any instance properties, or refer to self as a value until after the first phase of initialization is complete
 */

// The class instance isn’t fully valid until the first phase ends
// Properties can only be accessed, and methods can only be called, once the class instance is known to be valid at the end of the first phase

/**
 Phase 1
 - A designated or convenience initializer is called on a class
 - Memory for a new instance of that class is allocated. The memory isn’t yet initialized
 - A designated initializer for that class confirms that all stored properties introduced by that class have a value. The memory for these stored properties is now initialized
 - The designated initializer hands off to a superclass initializer to perform the same task for its own stored properties
 - This continues up the class inheritance chain until the top of the chain is reached
 - Once the top of the chain is reached, and the final class in the chain has ensured that all of its stored properties have a value, the instance’s memory is considered to be fully initialized, and phase 1 is complete
 */

/**
 Phase 2
 - Working back down from the top of the chain, each designated initializer in the chain has the option to customize the instance further. Initializers are now able to access self and can modify its properties, call its instance methods, and so on
 - Finally, any convenience initializers in the chain have the option to customize the instance and to work with self
 */

/**
 Here’s how phase 1 looks for an initialization call for a hypothetical subclass and superclass:
 ../Documents/Week2/Initialization/two_phase_initialization-1.png
 
 Step 1: In this example, initialization begins with a call to a convenience initializer on the subclass
 This convenience initializer can’t yet modify any properties
 It delegates across to a designated initializer from the same class
 
 Step 2: The designated initializer makes sure that all of the subclass’s properties have a value, as per safety check 1
 It then calls a designated initializer on its superclass to continue the initialization up the chain
 
 Step 3: The superclass’s designated initializer makes sure that all of the superclass properties have a value
 There are no further superclasses to initialize, and so no further delegation is needed
 
 Step 4: As soon as all properties of the superclass have an initial value, its memory is considered fully initialized, and phase 1 is complete
 
 Here’s how phase 2 looks for the same initialization call:
 ../Documents/Week2/Initialization/two_phase_initialization-2.png
 
 Step 1: The superclass’s designated initializer now has an opportunity to customize the instance further (although it doesn’t have to)
 
 Step 2: Once the superclass’s designated initializer is finished, the subclass’s designated initializer can perform additional customization (although again, it doesn’t have to)
 
 Step 3: Finally, once the subclass’s designated initializer is finished, the convenience initializer that was originally called can perform additional customization
 */

// MARK: - Initializer Inheritance and Overriding
// Unlike subclasses in Objective-C, Swift subclasses don’t inherit their superclass initializers by default
// Swift’s approach prevents a situation in which a simple initializer from a superclass is inherited by a more specialized subclass and is used to create a new instance of the subclass that isn’t fully or correctly initialized

/**
 NOTE:
 Superclass initializers are inherited in certain circumstances, but only when it’s safe and appropriate to do so
 For more information, see Automatic Initializer Inheritance below
 */

// If you want a custom subclass to present one or more of the same initializers as its superclass, you can provide a custom implementation of those initializers within the subclass

// When you write a subclass initializer that matches a superclass designated initializer, you are effectively providing an override of that designated initializer
// Therefore, you must write the override modifier before the subclass’s initializer definition
// This is true even if you are overriding an automatically provided default initializer, as described in Default Initializers

// As with an overridden property, method or subscript, the presence of the override modifier prompts Swift to check that the superclass has a matching designated initializer to be overridden, and validates that the parameters for your overriding initializer have been specified as intended

/**
 NOTE:
 You always write the override modifier when overriding a superclass designated initializer, even if your subclass’s implementation of the initializer is a convenience initializer
 */

/**
 Conversely, if you write a subclass initializer that matches a superclass convenience initializer, that superclass convenience initializer can never be called directly by your subclass, as per the rules described above in Initializer Delegation for Class Types
 Therefore, your subclass is not (strictly speaking) providing an override of the superclass initializer
 As a result, you don’t write the override modifier when providing a matching implementation of a superclass convenience initializer
 */

// EXAMPLE:
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
// Vehicle: 0 wheel(s)

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

/**
 The Bicycle subclass defines a custom designated initializer, init()
 This designated initializer matches a designated initializer from the superclass of Bicycle, and so the Bicycle version of this initializer is marked with the override modifier
 
 The init() initializer for Bicycle starts by calling super.init(), which calls the default initializer for the Bicycle class’s superclass, Vehicle
 This ensures that the numberOfWheels inherited property is initialized by Vehicle before Bicycle has the opportunity to modify the property
 After calling super.init(), the original value of numberOfWheels is replaced with a new value of 2
 */

// If you create an instance of Bicycle, you can call its inherited description computed property to see how its numberOfWheels property has been updated:
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
// Bicycle: 2 wheel(s)

/**
 If a subclass initializer performs no customization in phase 2 of the initialization process, and the superclass has a synchronous, zero-argument designated initializer, you can omit a call to super.init() after assigning values to all of the subclass’s stored properties
 If the superclass’s initializer is asynchronous, you need to write await super.init() explicitly
 */

// This example defines another subclass of Vehicle, called Hoverboard
// In its initializer, the Hoverboard class sets only its color property
// Instead of making an explicit call to super.init(), this initializer relies on an implicit call to its superclass’s initializer to complete the process
// EXAMPLE:
class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

// An instance of Hoverboard uses the default number of wheels supplied by the Vehicle initializer
let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")
// Hoverboard: 0 wheel(s) in a beautiful silver

// NOTE: Subclasses can modify inherited variable properties during initialization, but can’t modify inherited constant properties

// MARK: - Automatic Initializer Inheritance
// As mentioned above, subclasses don’t inherit their superclass initializers by default
// However, superclass initializers are automatically inherited if certain conditions are met
// In practice, this means that you don’t need to write initializer overrides in many common scenarios, and can inherit your superclass initializers with minimal effort whenever it’s safe to do so

// Assuming that you provide default values for any new properties you introduce in a subclass, the following two rules apply:

/**
 Rule 1
 - If your subclass doesn’t define any designated initializers, it automatically inherits all of its superclass designated initializers
 
 Rule 2
 - If your subclass provides an implementation of all of its superclass designated initializers—either by inheriting them as per rule 1, or by providing a custom implementation as part of its definition—then it automatically inherits all of the superclass convenience initializers
 
 These rules apply even if your subclass adds further convenience initializers
 
 NOTE:
 A subclass can implement a superclass designated initializer as a subclass convenience initializer as part of satisfying rule 2
 */

// MARK: - Designated and Convenience Initializers in Action
// EXAMPLE:
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
// The figure below shows the initializer chain for the Food class:
// ../Documents/Week2/Initialization/initializers_example-1.png

// Classes don’t have a default memberwise initializer, and so the Food class provides a designated initializer that takes a single argument called name

let namedMeat = Food(name: "Bacon")
// namedMeat's name is "Bacon"

// The init(name: String) initializer from the Food class is provided as a designated initializer, because it ensures that all stored properties of a new Food instance are fully initialized
// The Food class doesn’t have a superclass, and so the init(name: String) initializer doesn’t need to call super.init() to complete its initialization

// The Food class also provides a convenience initializer, init(), with no arguments
// The init() initializer provides a default placeholder name for a new food by delegating across to the Food class’s init(name: String) with a name value of [Unnamed]:
let mysteryMeat = Food()
// mysteryMeat's name is "[Unnamed]"

class RecipeIngredient: Food {
    // name property inherits from Food
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

// The figure below shows the initializer chain for the RecipeIngredient class:
// ../Documents/Week2/Initialization/initializers_example-2.png

/**
 The RecipeIngredient class has a single designated initializer, init(name: String, quantity: Int), which can be used to populate all of the properties of a new RecipeIngredient instance
 This initializer starts by assigning the passed quantity argument to the quantity property, which is the only new property introduced by RecipeIngredient
 After doing so, the initializer delegates up to the init(name: String) initializer of the Food class
 This process satisfies safety check 1 from Two-Phase Initialization above
 */

/**
 RecipeIngredient also defines a convenience initializer, init(name: String), which is used to create a RecipeIngredient instance by name alone
 This convenience initializer assumes a quantity of 1 for any RecipeIngredient instance that’s created without an explicit quantity
 The definition of this convenience initializer makes RecipeIngredient instances quicker and more convenient to create, and avoids code duplication when creating several single-quantity RecipeIngredient instances
 This convenience initializer simply delegates across to the class’s designated initializer, passing in a quantity value of 1
 */

/**
 The init(name: String) convenience initializer provided by RecipeIngredient takes the same parameters as the init(name: String) designated initializer from Food
 Because this convenience initializer overrides a designated initializer from its superclass, it must be marked with the override modifier (as described in Initializer Inheritance and Overriding)
 */

/**
 Even though RecipeIngredient provides the init(name: String) initializer as a convenience initializer, RecipeIngredient has nonetheless provided an implementation of all of its superclass’s designated initializers
 Therefore, RecipeIngredient automatically inherits all of its superclass’s convenience initializers too
 */

/**
 In this example, the superclass for RecipeIngredient is Food, which has a single convenience initializer called init()
 This initializer is therefore inherited by RecipeIngredient
 The inherited version of init() functions in exactly the same way as the Food version, except that it delegates to the RecipeIngredient version of init(name: String) rather than the Food version
 */

// All three of these initializers can be used to create new RecipeIngredient instances:
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

// MARK: - Failable Initializers
// It’s sometimes useful to define a class, structure, or enumeration for which initialization can fail
// This failure might be triggered by invalid initialization parameter values, the absence of a required external resource, or some other condition that prevents initialization from succeeding

// To cope with initialization conditions that can fail, define one or more failable initializers as part of a class, structure, or enumeration definition
// You write a failable initializer by placing a question mark after the init keyword (init?)

/**
 NOTE:
 You can’t define a failable and a nonfailable initializer with the same parameter types and names
 */

// A failable initializer creates an optional value of the type it initializes
// You write return nil within a failable initializer to indicate a point at which initialization failure can be triggered

/**
 NOTE:
 Strictly speaking, initializers don’t return a value
 Rather, their role is to ensure that self is fully and correctly initialized by the time that initialization ends
 Although you write return nil to trigger an initialization failure, you don’t use the return keyword to indicate initialization success
 */

// For instance, failable initializers are implemented for numeric type conversions
// To ensure conversion between numeric types maintains the value exactly, use the init(exactly:) initializer
// If the type conversion can’t maintain the value, the initializer fails

let pi = 3.14159
let valueChanged = Int(exactly: pi)
// valueChanged is of type Int?, not Int
if valueChanged == nil {
    print("\(pi) conversion to Int doesn't maintain value")
}
// Prints "3.14159 conversion to Int doesn't maintain value"

// EXAMPLE:
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

// You can use this failable initializer to try to initialize a new Animal instance and to check if initialization succeeded:
let someCreature = Animal(species: "Giraffe")
// someCreature is of type Animal?, not Animal

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
// Prints "An animal was initialized with a species of Giraffe"

// If you pass an empty string value to the failable initializer’s species parameter, the initializer triggers an initialization failure:
let anonymousCreature = Animal(species: "")
// anonymousCreature is of type Animal?, not Animal

if anonymousCreature == nil {
    print("The anonymous creature couldn't be initialized")
}
// Prints "The anonymous creature couldn't be initialized"

// MARK: - Failable Initializers for Enumerations
// You can use a failable initializer to select an appropriate enumeration case based on one or more parameters
// The initializer can then fail if the provided parameters don’t match an appropriate enumeration case

// EXAMPLE:
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
// Prints "This is a defined temperature unit, so initialization succeeded."

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This isn't a defined temperature unit, so initialization failed.")
}
// Prints "This isn't a defined temperature unit, so initialization failed."

// MARK: - Failable Initializers for Enumerations with Raw Values
// Enumerations with raw values automatically receive a failable initializer, init?(rawValue:), that takes a parameter called rawValue of the appropriate raw-value type and selects a matching enumeration case if one is found, or triggers an initialization failure if no matching value exists
enum TemperatureUnit2: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

let fahrenheitUnit2 = TemperatureUnit2(rawValue: "F")
if fahrenheitUnit2 != nil {
    print("This is a defined TemperatureUnit2 unit, so initialization succeeded.")
}
// Prints "This is a defined TemperatureUnit2 unit, so initialization succeeded."

let unknownUnit2 = TemperatureUnit2(rawValue: "X")
if unknownUnit2 == nil {
    print("This isn't a defined TemperatureUnit2 unit, so initialization failed.")
}
// Prints "This isn't a defined TemperatureUnit2 unit, so initialization failed."

// MARK: - Propagation of Initialization Failure
// A failable initializer of a class, structure, or enumeration can delegate across to another failable initializer from the same class, structure, or enumeration
// Similarly, a subclass failable initializer can delegate up to a superclass failable initializer

// In either case, if you delegate to another initializer that causes initialization to fail, the entire initialization process fails immediately, and no further initialization code is executed

/**
 NOTE:
 A failable initializer can also delegate to a nonfailable initializer
 Use this approach if you need to add a potential failure state to an existing initialization process that doesn’t otherwise fail
 */

// EXAMPLE:
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

/**
 The failable initializer for CartItem starts by validating that it has received a quantity value of 1 or more
 If the quantity is invalid, the entire initialization process fails immediately and no further initialization code is executed
 Likewise, the failable initializer for Product checks the name value, and the initializer process fails immediately if name is the empty string
 */

// If you create a CartItem instance with a nonempty name and a quantity of 1 or more, initialization succeeds:
if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
// Prints "Item: sock, quantity: 2"

// If you try to create a CartItem instance with a quantity value of 0, the CartItem initializer causes initialization to fail:
if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}
// Prints "Unable to initialize zero shirts"

// Similarly, if you try to create a CartItem instance with an empty name value, the superclass Product initializer causes initialization to fail:
if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}
// Prints "Unable to initialize one unnamed product"

// MARK: - Overriding a Failable Initializer
// You can override a superclass failable initializer in a subclass, just like any other initializer
// Alternatively, you can override a superclass failable initializer with a subclass nonfailable initializer
// This enables you to define a subclass for which initialization can’t fail, even though initialization of the superclass is allowed to fail

// Note that if you override a failable superclass initializer with a nonfailable subclass initializer, the only way to delegate up to the superclass initializer is to force-unwrap the result of the failable superclass initializer
/**
 NOTE:
 You can override a failable initializer with a nonfailable initializer but not the other way around
 */

class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

// MARK: - The init! Failable Initializer
// You typically define a failable initializer that creates an optional instance of the appropriate type by placing a question mark after the init keyword (init?)
// Alternatively, you can define a failable initializer that creates an implicitly unwrapped optional instance of the appropriate type
// Do this by placing an exclamation point after the init keyword (init!) instead of a question mark

// You can delegate from init? to init! and vice versa, and you can override init? with init! and vice versa
// You can also delegate from init to init!, although doing so will trigger an assertion if the init! initializer causes initialization to fail

// MARK: - Required Initializers
// Write the required modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer:
class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}

// You must also write the required modifier before every subclass implementation of a required initializer, to indicate that the initializer requirement applies to further subclasses in the chain
// You don’t write the override modifier when overriding a required designated initializer:
class SomeSubclass: SomeClass {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}

/**
 NOTE:
 You don’t have to provide an explicit implementation of a required initializer if you can satisfy the requirement with an inherited initializer
 */

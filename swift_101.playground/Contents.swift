
/**
 Primitive types and type casting, conditioning
 */
// constant uses let
let _constant = 10

//variable uses var
var variable = 0

// allows single line multi-variate declaration
var multiple0 = 0, multiple1 = 1, multiple3 = 2


//annotation can be as such
var annotatedVar : String = "String"


// when using annotation for multi-varaibe declaration situation, put annotation at the end of the declaration
var multiWithAnnotation0, multiWithAnnotation1, multiWithAnnotation2 : Double


// to print element, use print()
print("annotatedVar")

let colon = "colos are used when" ;
print(colon + " you are trying to use single statements on the multiple lines");


let intMax = Int.max
let intMin = Int.min

let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

let pi = Double(3) + 0.14159
print(pi)

//type aliases define an alternative name for an existing type. You define type aliases with the typealias keyword.
typealias test = Int
print(test.max)


var _b = true
var _nb = false


// nil = null
// nullable types are cated with a ?
var nullableVaraible : Int? = nil
print(nullableVaraible)


// Optional Binding is allowed
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

// error handling
func throwError() throws {
    // may or may not throw error
}

// assertion : evaluate whether statement is true or false
let assertion_test = 1
assert(assertion_test < 1, "this is when statement is false")

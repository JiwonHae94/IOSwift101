
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


// Colllections
/**
 * mutable collections are given var
 * immutable collections are given let
 */
var intArray : [Int] = []
intArray.append(1)
intArray.append(2)

print(intArray)

var defaultArray = Array(repeating: 1, count: 3)
print(defaultArray)

var arr1 = [1,2,3]
var arr2 = [4,5,6]
print(arr1)
print(arr2)
print(arr1 + arr2)

print((arr1 + arr2).count)

// fString is applied with \ instead of $
for item in (arr1 + arr2){
    print("item : \(item)")
}


//set
var testSet1 : Set = [1,2,3,4,5]
var testSet2 : Set = [3,4,5,6,7]

print("test set ", testSet1)

let union = testSet1.union(testSet2).sorted()
let inter = testSet1.intersection(testSet2)
print("union", union)
print("itersection", inter)


var testDic : [Int:String] = [1:"test1"]
print("testDic", testDic)
testDic[2] = "added_test2"

print("testDic", testDic)



// Flow Control
/**
 * WHILE
 */
var cnt = 0
repeat{
    cnt+=1
    print("repeat while cnt ", cnt)
} while cnt < 10


while cnt > 0 {
    cnt -= 1
    print("while cnt ", cnt)
}

/**
 FOR
 */
let testFor = [1,2,3,4,5,6,7,8,9]
for i in testFor{
    switch i%2==0 {
    case true:
        print("even number", i)
    case false :
        print("odd number", i)
    default:
        print("default")

    }

}

/**
 Tuples
 */
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

/**
 Value binding
 */
let anotherPoint = (2, 4)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

/*
 Where
 */
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}


/**
 Labeled Statements
 
 label name: while condition {
     statements
 }
 */
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}

/**
 Func
 
 "_" is added to omit paramter labeling
 */

func minMax(_ array: [Int]) -> (min: Int, max: Int) {
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


print(minMax([1,2,3,4,5,6]))


/**
 Variadic Parameters
 */

func varargFunc(_ numbers : Double...) -> Double{
    var total : Double = 0
    for num in numbers{
        total += num
    }
    return total
}

print(varargFunc(1,2,3,4,5,6))


/**
 In-Out Parameters
 */
func swapTwoInts(_ a: inout Int, _ b: inout Int){
    let tempA = a
    a = b
    b = tempA
}

var int1 = 3
var int2 = 4
swapTwoInts(&int1, &int2)

print(int1, int2)

/**
 Function as Paramter type
 */
func addTwoInts(_ a:Int, _ b : Int) -> Int {
    return a + b
}

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)


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

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

// closures
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
print(reversedNames)


reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})


let orig = [1,2,3, 8, 9, 0, 3, -1]
var clo1 = orig.sorted(by: {(i1, i2) -> Bool in
    return i2 > i1
})

var clo2 = orig.sorted(by : {i1, i2 in i2 > i1 })
var clo3 = orig.sorted(by : {$1 > $0 })
var clo4 = orig.sorted() {$1 > $0 }

print(clo4)


func closureFunc(_ closure : (Int, Int) -> Void){
    // do something
    closure(1, 2)
}

closureFunc { i1, i2 in
    print("closure : ", i1, i2)
}


// enum
enum SampleEnum : CaseIterable{
    case E1, E2
}

var test00 = SampleEnum.E1
print(test00)

var dir = SampleEnum.E1

switch(dir){
case SampleEnum.E1:
    print("case e1 :", dir)
case SampleEnum.E2:
    print("case e2 :", dir)
}


for item in SampleEnum.allCases{
    print(item)
}


// class
class SampleClass {
    let param1 : Int = 0
    let param2 : String = ""
    
    init(var1 : String){
        print("init", var1)
    }
    
    internal func test(){
        print("test sample class", param1, param2)
    }
    
    private func test1(){
        print("private test")
    }
    
    public func test3(){
        print("public test")
    }
}

struct SampleStruct{
    var p1 : Int = 0
    var p2 : Int = 0
}

SampleClass(var1: "sampleClass")

let class1 = SampleStruct(p1: 0, p2:3)
print(class1.p1, class1.p2)


struct TimeTable{
    subscript(index : Int) -> Int{
        get{
            return index + 1
        }
    }
}

print(TimeTable()[2])


// Generic
func genericFunc<T>(_ a : T, _ b : T, _ call:(T, T) -> String) -> String{
    return call(a, b)
}

let t = genericFunc(1,2) { i1, i2 in "generic"}
print(t)


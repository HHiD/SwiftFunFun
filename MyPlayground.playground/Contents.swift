import UIKit


var str = "Hello, playground"
print(str)

var string: String = "This is String"
var intValue: Int = 20


//Condition

for x in 0...5{
    let r = x + x
    print(r)
}


//Loop

var x = 5
while x > 0 {
    x -= 1
    print(x, "Hello")
}

x = 5
repeat {
    x -= 1
    print(x, "Hello")
}while x > 0

//Fuction

func addTwoNumbers() {
    let a = 1
    let b = 2
    let c = a + b
    print(c)
}

addTwoNumbers()

func returnAddValues(arg1: Int, arg2: Int) -> Int {
    return arg1 + arg2
}

print(returnAddValues(arg1: 1, arg2: 20))

func testFunc(name: String, age: Int) {
    print("My name is: \(name), age is: \(age)")
}

testFunc(name: "QBro", age: 18)

//Class

class BlogPost {
    var title = ""
    var body = ""
    var author = ""
    var numberOfComment = 0
    
    func addComment(){
        numberOfComment += 1
    }
    
}

var blogObj:BlogPost = BlogPost()
blogObj.title = "Title"
blogObj.body = "My Article"
blogObj.author = "Jeff"
blogObj.addComment()

var optionalBlog: BlogPost?
print("OptionalBlog: \(optionalBlog == nil)")


var messages = "HHDemond"
let consMessage = "Wahhaha"

print("\(messages) is \(consMessage)")

print(UINT8_MAX, UINT16_MAX, UINT32_MAX, UINT64_MAX)

let unsigned8: UInt8 = 12


var http404Error = (404, "NotFound")

print(http404Error.0, http404Error.1)
print(http404Error.self)

let (statusCode, statusMessage) = http404Error

print(statusCode, statusMessage, separator:" | ", terminator:" \n")


var optionalInt: Int?

var optionalString: String?

print(optionalInt == nil)
print(optionalString == nil)

if optionalInt == nil {
    optionalString = "I have Value"
    optionalInt = 404
}

if optionalString != nil {
    print(optionalString!)
}

if let possibleNumber = optionalInt {
    print(possibleNumber)
}else {
    print("No Value")
}

//guard let possibleObj = optionalBlog else {
//    print("Object Not Exist")
//    return
//}

var optionalValue: String?
let defaultValue = "DefaultValue"

print(optionalValue ?? defaultValue)



//Range

for i in 0..<5 {
    print(i)
}

var names = ["Hasky", "OngDi", "Sanmy", "Homi"]

for i in 0 ..< names.count {
    print(names[i])
}

for name in names {
    print(name)
}

for name in names[1...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

for name in names[..<2] {
    print(name)
}

let range = ..<7

print(range.contains(7))

var range2 = ...6

range2 = ...5

//String

let singleLinesString = "These are the same."
let multilineString =
"""
These are the same.
"""
print("Are those equal: \(singleLinesString == multilineString)")

let sparklingHeart = "\u{1F496}"
print(sparklingHeart)

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
print(threeDoubleQuotationMarks)

let dog = "Dog!🐶"
for character in dog {
    print(character)
}

let exclamationMark: Character = "!"
let catCharactes:[Character] = ["C", "a", "t", "🐱"]
let catString = String(catCharactes)
print(catString)

print(#"6 times 7 is \#(6*7)."#)

let greeting = "Greeting"

greeting[greeting.startIndex];
greeting[greeting.index(before: greeting.endIndex)];
greeting[greeting.index(greeting.startIndex, offsetBy: 3)]

for index in greeting.indices {
    print(index)
    print("\(greeting[index])")
}

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"

welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let strRange = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(strRange)
// welcome now equals "hello"

let home = "Home"
var theString = "Welcome Home"
let homeRange = theString.index(theString.endIndex, offsetBy: -home.count)..<theString.endIndex
theString.removeSubrange(homeRange)
print(theString)




var theSet = CharacterSet.init(charactersIn: "Hello")
let helloWorld = "Hello, World"
let helloRang = welcome.rangeOfCharacter(from:theSet)

//Generic Code
var aValue = 20
var bValue = 107
swap(&aValue, &bValue)
print(aValue, bValue)

//Generic Type

func swapValues<T>( a: inout T, b: inout T) {
    let tempValue = a
    b = tempValue
    a = b
}

struct Stack<Element> {
    var items = [Element]()
    
    mutating func pushData(item: Element) {
        items.append(item)
    }
    
    mutating func popData() -> Element {
        return items.removeLast()
    }
}

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items.last
    }
}

var theStack = Stack<Any>()
theStack.pushData(item: 1)
theStack.pushData(item: 25)
theStack.pushData(item: 9)
print(theStack.topItem ?? -1)
theStack.popData()
print(theStack.topItem ?? -1)

//Type Constraints

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int?{
    for (indx, value) in array.enumerated(){
        if value == valueToFind{
            return indx
        }
    }
    return nil
}

let valueTofind = 12
let itemsArray = [1, 23, 12, 5, 2, 6, 29, 30]
print(findIndex(of: valueTofind, in: itemsArray) ?? -1)

//Associated Type

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int {get}
    subscript(i: Int) -> Item {get}
}

struct IntStack:Container {
    var items = [Int]()
    mutating func push(_ item: Int){
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

var theIntStack = IntStack()

// Collection Type --Array
//Create array with default value
var defaultArr = Array(repeating: "2", count: 3)
print(defaultArr)
var anotherArray = Array(repeating: "3.14", count: 3)
var arrayTogether = defaultArr + anotherArray
arrayTogether.append("Hello")
arrayTogether += ["Polo", "Golf"]
arrayTogether[0...2] = ["Focus", "Lavidia", "Feista"]
arrayTogether.insert("Car", at: 0)
print(arrayTogether)

print(arrayTogether.first ?? "-1")
for (index, value) in arrayTogether.enumerated() {
    print("index: \(index), value: \(value)")
}

var numbers = [1, 2, 4, 6]
var copyOne = numbers
var copyTwo = numbers
copyOne[0] = 99
print(numbers, copyOne, copyTwo, separator: "\n")

print("--------------Set------------")
let oddDigits: Set = [1, 3, 5, 7, 9]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

print(oddDigits.union(singleDigitPrimeNumbers).sorted())
print(oddDigits.intersection(singleDigitPrimeNumbers).sorted())
print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())

let digitArr: [Int] = [1, 2, 2, 44, 6, 8]

let unicSet:Set = Set(arrayLiteral: digitArr)
print(unicSet)

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true

let cast = ["Vivien", "Marlon", "Kim", "Karl"]
print(cast.map{$0.lowercased()})

var dic = ["a":1, "b":2]
dic["c"] = 3
print(dic)
dic["c"] = 4
print(dic)


for x in stride(from: 0, to: 20, by: 5) {
    print(x)
}

var weirdNumber = 123

switch weirdNumber {
case 5, 2, 1, 8, 4:
    print("Nuber founded: \(weirdNumber) at State 1")
case 10, 23, 12:
    print("Nuber founded: \(weirdNumber) at State 2")
default:
    print("All Right")
}

/*Labeled Statements*/

//let finalSquare = 25
//var board = [Int](repeating: 0, count: finalSquare + 1)
//board[03] = +08; board[09] = +09; board[10] = +02; board[06] = +11;
//board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//var square = 0
//var diceRoll = 0
////label的用法
//gameLoop: while square != finalSquare {
//    diceRoll += 1
//    print("DiceRoll: \(diceRoll)")
//    if diceRoll >= 7 {
//        diceRoll == 1
//    }
//    switch square + diceRoll {
//    case finalSquare:
//        print("EndSquare: \(finalSquare)")
//        break gameLoop
//    case let newSquare where newSquare > finalSquare:
//        print("NewSquare: \(newSquare)")
//
//        continue gameLoop
//    default:
//        square += diceRoll
//        square += board[square]
//        print("square: \(square)")
//    }
//}
//print("Game over!")


func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])


func simpleFunc(number: Int?){
    if let theNum = number {
        print("You input: \(theNum)")
    }else {
        print("You input nothing")
    }
}

simpleFunc(number: 21)
simpleFunc(number:nil)


func vertyParam(for para: String...) -> String{
    var result: String = String.init()
    for item in para {
        result += item
    }
    return result
}

print(vertyParam(for: "h", "e", "l", "l", "o"))


func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts(_:_:), 3, 3)


func forword(_ a: Int) -> Int{
    return a + 1
}

func backword(_ a: Int) -> Int{
    return a - 1
}

func chooseSetpFuction(_ isForword: Bool) -> (Int) -> Int{
    return isForword ? forword(_:) : backword(_:)
}


print(chooseSetpFuction(true)(20))
let theStepFunction = chooseSetpFuction(false)
print(theStepFunction(21))


var allNames = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//Closure
// normal function
func compair(_ s1: String, _ s2: String) -> Bool{
    return s1 > s2
}

//Closure function
var a: (_ s1: String, _ s1: String) -> Bool =
{(_ s1: String, _ s2: String) -> Bool in
    return s1 > s2
}

var reverseResult = allNames.sorted(by: compair(_:_:))
print(reverseResult)
print(allNames.sorted(by: a))
print(allNames.sorted(by: {s1, s2 in s1 > s2}))
print(allNames.sorted(by: {$0>$1}))
print(allNames.sorted(){$0>$1})

class xObject:Comparable {
    static func == (lhs: xObject, rhs: xObject) -> Bool {
        return lhs.name == lhs.name
    }
    
    static func < (lhs: xObject, rhs: xObject) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func > (lhs: xObject, rhs: xObject) -> Bool {
        return lhs.name > rhs.name
    }
    
    static func <= (lhs: xObject, rhs: xObject) -> Bool {
        return lhs.name <= rhs.name
    }
    
    static func >= (lhs: xObject, rhs: xObject) -> Bool {
        return lhs.name >= rhs.name
    }
    
    
    var name:String = String.init()
    var phoneNumber:String = String.init()
    init(theName name: String, phone phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
    
}

func traverseXObject(_ xObjeArr: [xObject]) {
    for obj: xObject in xObjeArr {
        print(obj.name, obj.phoneNumber)
    }
    print("")
}

let diffPhoneNumbers = ["213123123",
                        "318721381",
                        "127372816",
                        "213621351",
                        "129837213"]

var objectArray:[xObject] = [xObject].init()
for (index, value) in allNames.enumerated() {
    let name: String = value
    let phone: String = diffPhoneNumbers[index]
    let obje = xObject.init(theName: name, phone: phone)
    
    objectArray.append(obje)
}

var xOrderdArray = objectArray.sorted(by: {(obj1: xObject, obj2: xObject) -> Bool in obj1.name < obj2.name})
var orderdObjArr = objectArray.sorted { (s1, s2) -> Bool in
    s1 < s2
}
var orderdObjArr2 = objectArray.sorted(by: {$0>$1})


traverseXObject(xOrderdArray)
traverseXObject(orderdObjArr)
traverseXObject(orderdObjArr2)


func trailingClosure(closure: () -> Void) {
    //Something goes here
    closure()
}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let pureNumbers = [16, 58, 510]

let numberStrings = pureNumbers.map { (number) -> String in
    var number = number
    var output = ""
    print("")
    repeat {
        output = digitNames[number % 10]! + output
        print("number: \(number), number % 10:\(number % 10)")
        number /= 10
    } while number > 0
    return output
}

print("\(numberStrings)\n")


func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void){
    print("Hello")
    completionHandler()
}

func someFunctionWithoutExcapingClosure(comple: () -> Void) {
    print("My My")
}

someFunctionWithEscapingClosure {
    print("Mami Mami Hong")
}

someFunctionWithoutExcapingClosure {
    print("Mami Mami Hong")
}


//autoclosure 就相当于OC里面弄一个block，然后单独调用，或者放在参数里面调用什么的
var customerLine = ["Alex", "Ewa", "Barry"]

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: {customerLine.remove(at: 0)})

//如果想要autoclosure 支持escape， 就需要同时使用@autoclosure 和 @escaping

var allClosure: [() -> String] = []

func funcWithAutoclosure(_ insideClosure: @autoclosure @escaping () -> String){
    print("A hahahah: \(insideClosure())")
}

allClosure.append({customerLine.remove(at: 0)})
allClosure.append({customerLine.remove(at: 0)})

for inClosure in allClosure {
    funcWithAutoclosure(inClosure())
}

enum CompassPoint {
    case north
    case south
    case east
    case west
}

var dirhaha = CompassPoint.north
print(dirhaha)

enum IterCases:CaseIterable {
    case a, b, c, d
}

print(IterCases.allCases.count)

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51225, 3)
var productQrCode = Barcode.qrCode("ABCDEFGHIJKLMNOP")

print(productBarcode)
print(productQrCode)

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("Qrcode: \(productCode)")
}


enum IntegerEnum: Int {
    case a = 0
    case b
    case c
}

var b = IntegerEnum.b

print("Is Equal: \(b.rawValue)")


if let someInt = IntegerEnum(rawValue: 9) {
    
    switch someInt {
    case .a:
        print("The a")
    case .b:
        print("The b")
    default:
        print("No safe place")
    }
}else {
    print("Wa haha No safe place")
}


class DataImporter {
    
    var fileName = "data.txt"
    
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
//Now the 'importer' property has not been initilized yet

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center:Point {
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
    }
}

class StepCounter {
    
    var totalSteps: Int = 0 {
        
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
        /*
         didSet(oldSteps) {
            if totalSteps > oldSteps {
                print("Added \(totalSteps - oldSteps) steps")
            }
         }
        */
        
    }
    
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 896

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty:Int {
        return 27
    }
    //class 和 static 关键字区别就是class可以重写
    class var overridebeComputedTypeProperty:Int {
        return 107
    }
    var someTestProperty: String = "IS-7"
    
}

class SubSomeClass:SomeClass {
    override class var overridebeComputedTypeProperty:Int {
        return 200
    }
}

var somCls = SomeClass()
somCls.someTestProperty
SomeClass.computedTypeProperty
SomeClass.storedTypeProperty
SomeClass.overridebeComputedTypeProperty

var subCls = SubSomeClass()
subCls.someTestProperty

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

leftChannel.currentLevel = 100
print(leftChannel.currentLevel)
// Prints "7"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "7"

struct SupoerPoint {
    var x = 0.0, y = 0.0
    static var pop = 2
    func moveBy(x deltaX: Double, y deltaY: Double) -> SupoerPoint{
        return SupoerPoint(x: (x + deltaX), y: (y + deltaY))
    }
}

let fixedPoint = SupoerPoint(x: 3.0, y: 3.0)
print(fixedPoint.moveBy(x: 2, y: 2))
SupoerPoint.pop = 10
print(SupoerPoint.pop)




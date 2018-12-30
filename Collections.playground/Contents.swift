import Foundation

/*:
 ## DICTIONARY
 */
var dict1 = MyDictionary.getInstance()
print("Total items in dictionary: \(dict1.count())")
print(dict1.dict)
let oldValue = dict1.dict.updateValue("Britain", forKey: "UK")
print("Old value: \(String(describing: oldValue))")
print(dict1.dict)
dict1.dict["UK"] = "Great Britain"
print(dict1.dict)
print("States with long names: \(dict1.statesWithLongNames())")

/*:
 ## SET
 */
var set1 = MySet.getInstance()
set1.insert(value: "One")
set1.insert(value: "Two")
set1.insert(value: "Three")
print("Set has \(set1.count()) items. Items are \(set1)")
print("\(set1.contains("Four"))")
print("\(set1.contains("Two"))")

/*:
 ## ARRAY
 */
var arr1 = MyArray<Int>()
arr1.append(1)
arr1.append(2)
arr1.append(4)
arr1.append(3)
arr1.append(2)
arr1.append(5)
arr1.append(2)
arr1.append(7)

var stringArray = MyArray<String>()
stringArray.append("Hello")
stringArray.append("-")
stringArray.append("Brother")

/*:
 ## -- Output --
 */

print("Total items in array before removal : \(arr1.count)")

let internalArray = arr1.removeFirstOccurance(of: 2)
print("After removing first occurance of 2 from MEMBER Array: \(internalArray)")

let a = arr1.removeElement(2)
print("After removing all occurances of 2 from MEMBER Array: \(a)")

// Making array mutable. Removing elements inplace within the array
var arr = [2,5,1,3,5,4,5,6,5]
arr1.removeFirstOccurance(of: 5, from: &arr)
print("After removing first occurance of 5 from external array arr: \(arr)")

// Reversing an external array
var arrayReversed = arr1.reverseOrder(of: arr)
print("Printing arr in reverse order: \(arrayReversed)")

// Reversing the internal array
if let reversedArray = arr1.reverse {
    print("Printing the MEMBER array of arr1 in reverse order: \(reversedArray)")
} else {
    print("MEMBER array of arr1 is nil")
}

/*:
 ## Implementing custom Functions with Closures
 */

/*:
 ###  func factorial(body closure: (String?) -> Void) -> Void
 */

arr1.setFactorialNumber(number: 5)
arr1.factorial{ (result) in
    // :Syntax of nil coalescing with simple optional and default value
    print(result ?? "Factorial is Nil")
}

arr1.setFactorialNumber(number: 3)
arr1.factorial{
    // :Syntax of nil coalescing with simple optional and default value
    print($0 ?? "Factorial is Nil")
    
    // :Syntax of nil coalescing when optional is a part of a String interpolation
    print("Factorial is: \($0 ?? "nil")")
}

/*:
 ###  func filterArray(basedOn closure: (Int) -> Bool) -> [Int]
 */

func numGreaterThanThree(value: Int) -> Bool {
    return value > 3
}
func numDivisibleByFive(value: Int) -> Bool {
    return value % 5 == 0
}
func numIsEven(value: Int) -> Bool {
    return value % 2 == 0
}

var filteredList = arr1.filterArray(basedOn: numGreaterThanThree)
print(filteredList)
filteredList = arr1.filterArray(basedOn: numDivisibleByFive)
print(filteredList)
filteredList = arr1.filterArray(basedOn: numIsEven)
print(filteredList)

/*:
 ###  func perform(initialResult: Int, nextPartialResult: (Int, Int) -> Int) -> Int
 */

//  :Complex calculations left for user to implement
var result = arr1.perform(0) {
    return $0 + ( $1 * $1)
}
print("Complex calculation in elements of MEMBER array of arr1: \(result)")

//  :Just another way of writing the above closure
result = arr1.perform(0) { (result, num1) -> Int in
    return result + ( num1 * num1)
}
print("Complex calculation in elements of MEMBER array of hello arr1: \(result)")

//  :Join all string elements of the array to make one string
var result2 = stringArray.perform("") {
    return $0 + $1
}
print("Concatenated string elements of array stringArray: \(result2)")

//  :Simple calculations
print("Concatenated string elements of array stringArray: \(stringArray.perform("", +))")
print("Factorial of elements in MEMBER array of arr1: \(arr1.perform(1, *))")
print("Sum of elements in MEMBER array of arr1: \(arr1.perform(0, +))")

/*:
 ## Inbuilt HIGHER ORDER functions in Collections
 */

/*:
 ### Using forEach
 */
let values = [1,2,3,4,5]
values.forEach {
    print("Square of \($0): is \($0*$0)")
}

/*:
 ### Using filter
 */
let prices = [1.5, 4.5, 6.5, 2.5, 8.5]
let largePrices = prices.filter {
    return($0 > 5)
}
print("Elements with prices > $5: ", separator: "", terminator: "")
for element in largePrices {
    print("\(element)", separator: "", terminator: ", ")
}

let names = ["Amit", "Binish", "Ram", "John", "Henry"]
let namesWithMoreThanFourLetters = names.filter {
    return $0.count > 4
}
print()
print("Elements with name > 4 letters: ", separator: "", terminator: "")
print(namesWithMoreThanFourLetters)

/*:
 ### Using reduce
 */

let combinedNames = namesWithMoreThanFourLetters.reduce("") {
    return $0 + $1
}
print("Concatenated string of names: \(combinedNames)")


import Foundation

public protocol Container {
    associatedtype Item
    func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

public protocol SuffixableContainer: Container {
    associatedtype suffix: SuffixableContainer
    func suffix(_ items: Int) -> suffix
}

public class MyArray<Element: Equatable>: Container {
    private var factorialNumber: Double = 0
    private var items = [Element]()
    
    //    internal var instance: MyArray?
    
    public init() {}
    
    /*
     public static func getInstance() -> MyArray {
     if self.instance == nil {
     self.instance = MyArray()
     }
     return self.instance!
     }*/
    
    public func append(_ item: Element) {
        items.append(item)
    }
    
    public var count: Int {
        return items.count
    }
    
    /*
     public func suffix(_ items: Int) -> MyArray<Element>.suffix {
     //var result
     }*/
    
    public subscript(index: Int) -> Element {
        return items[index]
    }
    
    public func setFactorialNumber(number value: Double) {
        factorialNumber = value
    }
    
    public func removeElement(_ item: Element) -> [Element] {
        var found = true
        while found {
            if items.contains(item) {
                let index = items.index(of: item)
                items.remove(at: index!)
            } else {
                found = false
            }
        }
        return items
    }
    
    public func removeElement(_ item: Element, from array: inout [Element]) -> [Element] {
        var found = true
        while found == true {
            if array.contains(item) {
                let index = array.index(of: item)
                array.remove(at: index!)
            } else {
                found = false
            }
        }
        return array
    }
    
    public func removeFirstOccurance(of item: Element) -> [Element] {
        let index = items.index(of: item)
        
        items.remove(at: index!)
        return items
    }
    
    public func removeFirstOccurance(of value: Element, from array: inout [Element]) {
        let index = array.index(of: value)
        
        array.remove(at: index!)
    }
    
    public func reverseOrder(of array: [Element]) -> [Element] {
        var returnArray : [Element] = []
        var counter = array.count - 1
        
        for _ in (0...array.count - 1) {
            returnArray.append(array[counter])
            counter -= 1
        }
        return returnArray
    }
    
    /* --------------------------- creating functions with CLOSURES --------------------------- */
    
    /*************** a pure closure function ***************/
    public lazy var reverse = { () -> [Element]? in
        var returnArray = [Element]()
        
        if self.items.isEmpty {
            return nil
        } else {
            var counter = self.items.count - 1
            for _ in (0...self.items.count - 1) {
                returnArray.append(self.items[counter])
                counter -= 1
            }
            return returnArray
        }
    }()
    
    /*************** factorial function ***************/
    public func factorial(body closure: (String?) -> Void) -> Void {
        var output: String?
        var result: Double = 1
        
        if factorialNumber <= 0 {
            output = nil
        } else {
            output = ""
            while(factorialNumber >= 1) {
                if factorialNumber == 1 {
                    output = output! +  "\(factorialNumber) = \(result)"
                    break
                } else {
                    output = output! + "\(factorialNumber) x "
                }
                result = result * factorialNumber
                factorialNumber -= 1
            }
        }
        closure(output) // calling the closure
    }
    
    
    /*************** Custom filter like function ***************/
    public func filterArray(basedOn closure: (Element) -> Bool) -> [Element] {
        var filteredList = [Element]()
        
        for element in items {
            if closure(element) {  // calling the closure
                filteredList.append(element)
            }
        }
        return filteredList
    }
    
    /*************** Custom reduce like function ***************/
    public func perform<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) -> Result) -> Result {
        var result = initialResult
        
        for element in items {
            result = nextPartialResult(result, element)  // calling the closure
        }
        return result
    }
}



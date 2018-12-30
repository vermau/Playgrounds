import Foundation

public class MyDictionary {
    public var dict = ["IN": "India", "US": "United States", "AU": "Australia", "CN": "Canada", "UK": "United Kingdom"]
    private static var instance: MyDictionary?
    
    private init() {
    }
    
    public static func getInstance() -> MyDictionary {
        if self.instance == nil {
            self.instance = MyDictionary()
        }
        return instance!
    }
    
    public func count() -> Int {
        return dict.count
    }
    
    public func statesWithLongNames() -> [String] {
        var arr = [String]()
        
        for (_, name) in dict {
            if name.count >= 8 {
                arr.append(name)
            }
        }
        return arr
    }
    
    /*public func merge(_dict1: [String : String], with dict2: [String : String] -> [String : String]) {
     }*/
    
}


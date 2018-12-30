import Foundation

public class MySet {
    private var set1: Set<String> = ["Five", "Six"]
    private static var instance: MySet?
    
    private init() {}
    
    public static func getInstance() -> MySet {
        if self.instance == nil {
            self.instance = MySet()
        }
        return instance!
    }
    
    public func insert(value val: String) {
        set1.insert(val)
    }
    
    public func count() -> Int {
        return set1.count
    }
    
    public func contains(_ value: String) -> Bool {
        return set1.contains(value)
    }
}


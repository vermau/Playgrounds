import Foundation

/* ---------------- Factorial using reduce ---------------- */

struct Math {
    static func factorial(of number: Int) -> Int {
        return(1...number).reduce(1, *)
    }
    
    static func nthTriangle(of number: Int) -> Int {
        return(1...number).reduce(0, +)
    }
}

extension Math {
    static func primeFactors(of number: Int) -> [Int] {
        var remainingValue = number
        var primeFactors = [Int]()
        var testFactor = 2
        
        while testFactor * testFactor <= remainingValue {
            if remainingValue % testFactor == 0 {
                primeFactors.append(testFactor)
                remainingValue /= testFactor
            } else {
                testFactor += 1
            }
        }
        if remainingValue > 1 {
            primeFactors.append(remainingValue)
        }
        
        return primeFactors
    }
}

print("Factorial of 5 = \(Math.factorial(of: 5))")
print("Nth Triangle of 5 = \(Math.nthTriangle(of: 5))")
print("Prime factors of 40 = \(Math.primeFactors(of: 126))")


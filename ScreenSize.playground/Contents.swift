import Foundation

struct TV {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    var diagonal: Int {
        get {
            let result = ((height * height) + (width * width)).squareRoot().rounded()
            return Int(result)
        }
        
        set {
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            
            let ratioDiagonal = ((ratioWidth * ratioWidth) + (ratioHeight * ratioHeight)).squareRoot().rounded()
            height = (Double(newValue) * ratioHeight / ratioDiagonal).rounded()
            width = (height * ratioWidth / ratioHeight).rounded()
        }
    }
}

var tv = TV(width: 20.0, height: 20.0)
print(tv.diagonal)
tv.diagonal = 110
print("Height: \(tv.height) and Width: \(tv.width)")


import Foundation

@dynamicMemberLookup
struct CheckerBoard {
    enum Square: String {
        case empty = "▪️"
        case red = "🔴"
        case white = "⚪️"
    }
    
    typealias Coordinate = (x: Int, y: Int)
    
    private var board: [[Square]] = [
        [ .empty, .red,   .empty, .red,   .empty, .red,   .empty, .red   ],
        [ .red,   .empty, .red,   .empty, .red,   .empty, .red,   .empty ],
        [ .empty, .red,   .empty, .red,   .empty, .red,   .empty, .red   ],
        [ .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty ],
        [ .empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty ],
        [ .white, .empty, .white, .empty, .white, .empty, .white, .empty ],
        [ .empty, .white, .empty, .white, .empty, .white, .empty, .white ],
        [ .white, .empty, .white, .empty, .white, .empty, .white, .empty ]
    ]
    
    private func convert(stringExpression: String) -> Coordinate {
        let expression = try! NSRegularExpression(pattern: "[xy](\\d+)")
        let matches = expression.matches(in: stringExpression, options: [], range: NSRange(stringExpression.startIndex..., in: stringExpression))
        
        let xy = matches.map { String(stringExpression[Range($0.range(at: 1), in: stringExpression)!]) }
        let x = Int(xy[0])!
        let y = Int(xy[1])!
        
        return (x: x, y: y)
    }
    
    func piece(at coordinate: Coordinate) -> Square {
        return board[coordinate.y][coordinate.x]
    }
    
    mutating func setPiece(at coordinate: Coordinate, to value: Square) {
        board[coordinate.y][coordinate.x] = value
    }
    
    subscript(coordinate: Coordinate) -> Square {
        get {
            return board[coordinate.y][coordinate.x]
        }
        
        set {
           board[coordinate.y][coordinate.x] = newValue
        }
    }
    
    subscript(x: Int, y: Int) -> Square {
        get {
            return self[(x: x, y: y)]
        }
        
        set {
            self[(x: x, y: y)] = newValue
        }
    }
    
    subscript(input: String) -> Square {
        get {
            let coordinate = convert(stringExpression: input)
            return self[coordinate]
        }
        
        set {
            let coordinate = convert(stringExpression: input)
            self[coordinate] = newValue
        }
    }
    
    subscript(dynamicMember input: String) -> Square {
        get {
            let coordinate = convert(stringExpression: input)
            return self[coordinate]
        }
        
        set {
            let coordinate = convert(stringExpression: input)
            self[coordinate] = newValue
        }
    }
}

extension CheckerBoard: CustomStringConvertible {
    var description: String {
        return board.map{ row in row.map{ $0.rawValue }.joined(separator: "") }.joined(separator: "\n") + "\n"
    }
}

var checkerBoard = CheckerBoard()
print(checkerBoard) // Prints the whole checkerBoard

let coordinate = (x: 3, y: 2)
print(checkerBoard[coordinate])

checkerBoard[coordinate] = .white
print(checkerBoard) // Prints the whole checkerBoard

print(checkerBoard[1, 6])
checkerBoard[6, 1] = .white
print(checkerBoard) // Prints the whole checkerBoard

print(checkerBoard["x2y5"])
checkerBoard["x2y5"] = .red
print(checkerBoard)

print(checkerBoard.x6y7)
checkerBoard.x6y7 = .red
print(checkerBoard)

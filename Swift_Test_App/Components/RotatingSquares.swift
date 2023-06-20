import SwiftUI

struct RotatingSquares: View {
    private var squareSideLength: CGFloat = 0
    private var matrix: [[Bool]] = []
    
    init(n: Int, width: CGFloat, height: CGFloat) {
        var mutableN = n
        self.squareSideLength = getOptimalSideLength(n: n, width: width, height: height)
        print(width, height, squareSideLength)
        self.matrix = (0..<Int(width / squareSideLength)).indices.map { _ in
            return (0..<Int(height / squareSideLength)).indices.map{ _ in
                if mutableN > 0 {
                    mutableN-=1
                    return true
                } else {
                    return false
                }
            }
        }
    }
    var body: some View {
        HStack(spacing: 0) {
                ForEach(Array(matrix.enumerated()), id: \.element) { columnIndex, column in
                    VStack(spacing: 0) {
                        ForEach(Array(column.enumerated()), id: \.element) {rowIndex, row in
                            if row {
                                RotatingSquare(length: squareSideLength).id(rowIndex)
                            }
                        }
                    }.id(columnIndex)
                }
            }
    }
    
    func getOptimalSideLength(n: Int, width: Double, height: Double) -> Double {
        let sizePerSquare = width * height / Double(n)
        let squareSideLength: Double = sqrt(sizePerSquare)
        let smallerSideLength: Double = min(height, width)
        let biggerSideLength: Double = max(height, width)
        if squareSideLength <= smallerSideLength && squareSideLength <= biggerSideLength / Double(n) {
            return squareSideLength
        }
        var rows = 1
        var smallerSideCellLength = 0.0
        var biggerSideCellLength = 0.0
        var nextSmallerSideCellLength = 0.0
        while (biggerSideCellLength <= nextSmallerSideCellLength) {
            smallerSideCellLength = smallerSideLength / Double(rows)
            biggerSideCellLength = biggerSideLength / ceil(Double(n) / Double(rows))
            nextSmallerSideCellLength = smallerSideLength / Double((rows + 1))
            rows += 1
        }
        return min(smallerSideCellLength, biggerSideCellLength)
    }
}

struct RotatingSquares_Previews: PreviewProvider {
    static var previews: some View {
        RotatingSquares(n: 4, width: 100, height: 100)
    }
}

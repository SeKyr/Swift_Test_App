import SwiftUI

class Node {
    var data: Int
    var left: Node?
    var right: Node?
    

    init(data: Int) {
        self.data = data
    }
}

struct CalculationView: View {
    
    var isReset: Bool?
    
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            CalculationWidget(title: "Fib", algorithmImplementation: {(n) -> UInt64 in return fibnonacciAlgorithm(n: n)}, isReset: isReset)
            CalculationWidget(title: "Matrix", algorithmImplementation: {(n) -> UInt64 in return matrixMultiplicationAlgorithm(n: n)}, isReset: isReset)
            CalculationWidget(title: "Binary", algorithmImplementation: {(n) -> UInt64 in return binarySearchTreeAlgorithm(n: n)}, isReset: isReset)
            CalculationWidget(title: "Array", algorithmImplementation: {(n) -> UInt64 in return reverseArrayAlgorithm(n: n)}, isReset: isReset)
        }
        .padding()
    }
    
    func fibnonacciAlgorithm(n: Int) -> UInt64 {
        return measureMilliTime {
            fib(n: n)
        }
    }
    
    func fib(n: Int) -> Int {
        if n <= 2 {
            return 1
        } else {
            return fib(n: n - 1) + fib(n: n - 2)
        }
    }
    
    func matrixMultiplicationAlgorithm(n: Int) -> UInt64 {
        let firstMatrix: [[Int]] = (0..<n).indices.map { (row) in
            return (0..<n).indices.map{(column) in
                return (row + 1) * (column + 1)}
        }
        let secondMatrix: [[Int]] = (0..<n).indices.map { (row) in
            return (0..<n).indices.map{(column) in
                return (row + 1) + (column + 1)}
        }
        
        var resultMatrix: [[Int]] = (0..<n).indices.map { (row) in
            return [Int](0...n)
        }
        
        return measureMilliTime {
            for row in 0..<n {
                for col in 0..<n {
                    var cell: Int = 0;
                    for h in 0..<n {
                        cell += firstMatrix[row][h] * secondMatrix[h][col];
                    }
                    resultMatrix[row][col] = cell;
                }
            }
        }
    }
    
    func binarySearchTreeAlgorithm(n: Int) -> UInt64 {
        let data: [Int] = (0..<n).indices.map { (i) in
            let doubleVal = sin(Double(i))-sin(Double(i+1))
            return Int(doubleVal*1000)
        }
        
        return measureMilliTime {
            for i in data {
                self.insert(data: i)
            }
        }
        
    }
    
    @State private var root: Node?
    
    func insert(data: Int) -> Void {
        let newNode: Node = Node(data: data);
        if self.root == nil {
            self.root = newNode;
            return;
        } else {
            var current = self.root;
            while current != nil {
                if data < current!.data {
                    if(current!.left != nil) {
                        current = current!.left;
                    } else {
                        current!.left = newNode;
                        return;
                    }
                } else {
                    if current!.right != nil {
                        current = current!.right;
                    } else {
                        current!.right = newNode;
                        return;
                    }
                }
            }
            return;
        }
    }
        
        func reverseArrayAlgorithm(n: Int) -> UInt64 {
            let integerArray = [Int](0...n)
            return measureMilliTime {
                reverse(toReverse: integerArray)
            }
        }
        
        func reverse(toReverse: Array<Int>) -> Array<Int> {
            if toReverse.isEmpty {
                return []
            }
            var mutableArray = toReverse
            let first: Int = mutableArray.removeFirst()
            var reversed = reverse(toReverse: mutableArray)
            reversed.append(first)
            return reversed
        }
        
    func measureMilliTime(_ block: () -> Void) -> UInt64 {
            let start = DispatchTime.now()
            block()
            let end = DispatchTime.now()
            
            let elapsedNanos = end.uptimeNanoseconds - start.uptimeNanoseconds
            
            return elapsedNanos / NSEC_PER_MSEC
        }
}
    
struct CalculationView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationView()
    }
}

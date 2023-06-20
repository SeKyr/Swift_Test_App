import SwiftUI

struct CalculationWidget: View {
    var title: String = ""
    @State private var executionTime: UInt64?
    @State private var n: Int?
    var algorithmImplementation: (Int) -> UInt64
    
    var isReset: Bool?
    var body: some View {
        HStack {
            Text("\(title):").frame(width: 50).font(.system(size: 14))
            NInput(onStart: onStart, isReset: isReset)
            HStack {
                if executionTime != nil && n != nil {
                    Text("\(executionTime!)μs; n = \(n!)").font(.system(size: 14))
                }
            }.frame(width: 100)
        }.onChange(of: isReset) { newValue in
            executionTime = nil
            n = nil
        }
    }
    
    func onStart(n: Int) -> Void {
        self.n = n
        self.executionTime = self.algorithmImplementation(n)
    }
}

struct CalculationWidget_Previews: PreviewProvider {
    static var previews: some View {
        CalculationWidget(title: "Test", algorithmImplementation: {
            (n: Int) -> UInt64 in
            return 4
        })
    }
}

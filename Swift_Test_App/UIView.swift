import SwiftUI

struct UIView: View {
    @State private var nLocal: Int?
    var isReset: Bool?
    var body: some View {
        VStack() {
            if nLocal == nil {
                NInput(onStart: {
                    (n: Int) -> Void in
                    self.nLocal = n
                })
            } else {
                GeometryReader { geometry in
                    RotatingSquares(n: nLocal!, width: geometry.size.width, height: geometry.size.height).position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
                }
                
            }
        }.onChange(of: isReset) { newValue in
            nLocal = nil
        }
        
    }
    
    func reset() -> Void {
        self.nLocal = nil
    }
}

struct UIView_Previews: PreviewProvider {
    static var previews: some View {
        UIView()
    }
}

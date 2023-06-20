import SwiftUI

struct RotatingSquare: View {
    @State private var rotationAngle: Angle = .zero
    var length: CGFloat

    var body: some View {
        Rectangle()
            .frame(width: length, height: length)
            .foregroundColor(.blue)
            .border(Color.black, width: 1)
            .rotationEffect(rotationAngle)
            .onAppear {
                rotateSquare()
            }
        
        
        
    }

    func rotateSquare() {
        withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false)) {
            rotationAngle = .degrees(360)
        }
    }
}

struct RotatingSquare_Previews: PreviewProvider {
    static var previews: some View {
        RotatingSquare(length: 100)
    }
}

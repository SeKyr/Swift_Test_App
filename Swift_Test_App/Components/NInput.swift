import SwiftUI

struct NInput: View {
    @State private var n = 0
    var onStart: (Int) -> Void
    var isReset: Bool?
    var body: some View {
        HStack {
            TextField("n", value: $n, format: .number)
                .textFieldStyle(.roundedBorder).frame(width: 50)
            
            Button("Start", action: {
                self.onStart(n)
            } )
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 33 / 255, green: 150 / 255, blue: 243 / 255, opacity: 100))
        }.onChange(of: isReset){ newValue in
            n = 0
        }
    }
}

struct NInput_Previews: PreviewProvider {
    static var previews: some View {
        NInput(onStart: {
            (n: Int) -> Void in print(n)
        })
    }
}

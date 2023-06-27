import SwiftUI

@main
struct Swift_Test_AppApp: App {
    @State private var tabSelection = 0
    @State private var resetUIView = false
    
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = UIColor(red: 33 / 255, green: 150 / 255, blue: 243 / 255, alpha: 100)
          coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
          
          UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
          
          UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView(selection: $tabSelection) {
                    UIView(isReset: tabSelection == 1).tabItem {
                        Image(systemName: "eye.fill")
                        Text("UI-View")
                    }.tag(0).clipped()
                    CalculationView(isReset: tabSelection == 1).tabItem {
                        Image(systemName: "minus.forwardslash.plus")
                        Text("Calculation-View")
                    }.tag(1)
                }.navigationBarTitle("Swift Test App").navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

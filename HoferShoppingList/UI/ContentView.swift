import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var unlocked = false
    @State private var text = NSLocalizedString("locked-name", comment:"")
    
    var body: some View {
        VStack {
            Text("Hofer Cart").font(.largeTitle)
            Text(LocalizedStringKey(text))
                .bold()
                .padding()
            
            Button("authenticate-name") {
                authenticate()
            }
            
            
            .fullScreenCover(isPresented: $unlocked) {
                MyContentView()
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // Check whether it's possible to use biometric authentication
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {

            // Handle events
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "This is a security check reason.") { success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        self.text = "UNLOCKED"
                        self.unlocked = true
                    } else {
                        self.text = "There was a problem!"
                    }
                }
            }
        } else {
            self.text = "Phone does not have biometrics"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  FicheTechniqueApp.swift
//  FicheTechnique
//
//  Created by m1 on 17/02/2022.
//

import SwiftUI
import Firebase

@main
struct FicheTechniqueApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    /*init(){
        FirebaseApp.configure()
    }*/
    var ingrsVM : IngrsVM = IngrsVM()
    var body: some Scene {
        WindowGroup {
            let signInVM = SignInViewModel()
            ContentView(ingrsVM: ingrsVM).environmentObject(signInVM)
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    
    }
}


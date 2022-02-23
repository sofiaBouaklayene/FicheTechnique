//
//  FicheTechniqueApp.swift
//  FicheTechnique
//
//  Created by m1 on 17/02/2022.
//

import SwiftUI
import Firebase
//import FirebaseFirestore

@main
struct FicheTechniqueApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    /*init(){
        print("Coucou")
        FirebaseApp.configure()
        
    }*/
    //var ingredient : Ingredient
    var body: some Scene {
        WindowGroup {
            let signInVM = SignInViewModel()
            ContentView().environmentObject(signInVM)
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    
    }
}


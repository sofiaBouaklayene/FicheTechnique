//
//  ContentView.swift
//  FicheTechnique
//
//  Created by m1 on 17/02/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var signInVM : SignInViewModel
    @ObservedObject var ingrsVM : IngrsVM = IngrsVM()
    @ObservedObject var fichesVM : FichesVM = FichesVM()
    
    var body: some View {
        TabBar(ingrsVM: ingrsVM, fichesVM: fichesVM)
        /*NavigationView{
            if signInVM.isSignedIn{
                Text("You are signed in" )
                Button(action:{
                    signInVM.signOut()
                    
                }, label:{
                    Text("Sign Out").foregroundColor(Color.blue)
                })
            }
            else{
                SignInView()
            }
        }*/
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var ingrsVM : IngrsVM = IngrsVM()
    static var fichesVM : FichesVM = FichesVM()
    
    static var previews: some View {
        ContentView(ingrsVM: ingrsVM, fichesVM: fichesVM)
    }
}

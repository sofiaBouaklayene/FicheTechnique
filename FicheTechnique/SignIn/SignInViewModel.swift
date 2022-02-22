//
//  SignInViewModel.swift
//  FicheTechnique
//
//  Created by m1 on 17/02/2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class SignInViewModel : ObservableObject{
    let auth = Auth.auth()
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password){[weak self]
            result, error in
            guard result != nil, error == nil else{
                print("pas bien ici")
                return
               
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }            //signeIn avec succes
        }
        
    }
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password){[weak self]
            result, error in
            guard result != nil, error == nil else{
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
        
    }
    func signOut(){
        try? auth.signOut()
        self.signedIn = false
    }
    
}

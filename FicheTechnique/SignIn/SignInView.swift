//
//  SignInView.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
import SwiftUI

struct SignInView: View{
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var signInVM : SignInViewModel
    
    var body: some View{
        VStack{
            TextField("Email Address", text: $email).background(Color(.secondarySystemBackground)).padding();
            SecureField("password", text: $password).background(Color(.secondarySystemBackground)).padding();
    
            Button(action: {
                print("je suis la\(email) : \(password)")
                guard !email.isEmpty, !password.isEmpty else{
                    return
                }
                signInVM.signIn(email: email, password: password)
                print("I'm here")
                
            }, label: {
                Text("Sign In").foregroundColor(Color.white).frame(width: 200, height: 50).background(Color.orange).cornerRadius(8)
            })
            
        Spacer()
        }.navigationTitle("Sign In")    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

//
//  ModifyIngrSheetView.swift
//  FicheTechnique
//
//  Created by m1 on 20/02/2022.
//

import SwiftUI
import Foundation

struct ModifyIngrSheetView: View{
    @ObservedObject var vmIngredient : IngredientViewModel
    @ObservedObject var ingrsVM : IngrsVM
    @State var errorMessage = "Error !"
    @State var showingAlert : Bool = false
    var intent : Intent
    init(vmIngredient : IngredientViewModel, ingrsVM : IngrsVM){
        self.vmIngredient = vmIngredient
        self.ingrsVM = ingrsVM
        self.intent = Intent()
        self.intent.addObserver(viewModel: self.vmIngredient)
        self.intent.addObserver(listViewModel: self.ingrsVM)
    }
    
    var body: some View{
            VStack{
                Form{
                    Section{
                        Text("Nouveau ingredient:").padding(10)
                        TextField("Entrer le nouveau ingredient", text: $vmIngredient.nom).textFieldStyle(RoundedBorderTextFieldStyle()).padding(10)
                    }
                }
                Button(action :{
                    intent.intentToChange(name: vmIngredient.nom)
            
                  
                }, label:{
                    Text("Ajouter au stock").bold().frame(width: 300, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding()
                })
                
                
            }
            
            
            .onChange(of: vmIngredient.error){
                error in switch error{
                case .noError:
                    return
                case .tooShortName:
                    self.errorMessage = "\(error)"
                    self.showingAlert = true
                }
            }.alert(errorMessage,isPresented: $showingAlert){
                Button("Ok", role : .cancel){}
            }
        }
}
struct ModifyIngrSheetView_Previews: PreviewProvider {
    static var ingrsVM : IngrsVM = IngrsVM()
    static var vmIngredient : IngredientViewModel = IngredientViewModel(ingredient: Ingredient(nom: "toto", categorie: "fruit", PU: 5, unite: "kg", qtteStock: 2, allergene: true, CatAllergene: "truc"))
    
    static var previews: some View {
        ModifyIngrSheetView(vmIngredient: vmIngredient, ingrsVM: ingrsVM)
    }
}

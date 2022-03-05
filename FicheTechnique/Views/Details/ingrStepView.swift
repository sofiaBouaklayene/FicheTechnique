//
//  ingrStepView.swift
//  FicheTechnique
//
//  Created by m1 on 04/03/2022.
//

import Foundation
//
//  AddIngrSheetView.swift
//  FicheTechnique
//
//  Created by m1 on 20/02/2022.
//

import Foundation
import SwiftUI
import Foundation
import Firebase
import FirebaseFirestore

struct ingrStepView: View{
    
    let formatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    let col = [GridItem](repeating: .init(.flexible()), count: 2)
    
    
    @StateObject var ingredViewModel = IngredientViewModel(ingredient: Ingredient(nom: "", categorie: "", PU: 0, unite: "", qtteStock: 0, allergene: true, CatAllergene: ""))
    
    
    
    @ObservedObject var ingrsVM : IngrsVM
    //@ObservedObject var etapeVM : EtapesVM
    
    @State var selectedIngredient : String = ""
    
    @State var prixUnitaire : Int = 0
    //pour le moment on fait ca
    @State var quantite : Int = 0
    @State var ingreEtape : ModelIngredFiche = ModelIngredFiche(nomingredient: "", quantite: 0)
    @StateObject var etapeVM : EtapeViewModel = EtapeViewModel(etape: Etape(titreEtape: "", NomDenree: "", Ingredients: [("",0)], description: "", temps: 0))
    
    
    
    var body: some View{
        NavigationView{
            VStack{
                Text("Ingrédients").font(.title)
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            Button("Add") {
                                
                                print("Pressed")
                            }
                        }
                    }
                LazyVGrid(columns: col, alignment: .leading){
                    
                    Text("Ingredient").padding()
                    /*
                    Picker("Ingredient", selection: $etapeVM.Ingredients){
                        ForEach(ingrsVM.ingredients, id: \.id){
                            ingred in Text(ingred.nom)
                        }.padding(5)
                        
                       
                    }*/
                    Text("Quantité").padding()
                    TextField("Quantite", value: self.$etapeVM.Ingredients, formatter: formatter).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5)
                    
                   
                    
                    
                    
                
                
            }
           
        }
}
    
}
}

/*
extension ingrStepView{
    private func saveIngredient(){
        let ingred = ModelIngredFiche(nomingredient: nomingredient, quantite: quantite)
        ingrsVM.addIngredient(ingredient: ingred)
    }
}
*/

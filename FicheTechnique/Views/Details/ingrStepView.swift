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
    @State var selectedquantite : Int = 0
    @State var selectedunite : String = ""
    
    @State var prixUnitaire : Int = 0
    //pour le moment on fait ca
    @State var quantite : Int = 0
    @State var ingreEtape : ModelIngredFiche = ModelIngredFiche(nomingredient: "", quantite: 0)
    @StateObject var etapeViewModel : EtapeViewModel = EtapeViewModel(etape: Etape(titreEtape: "", NomDenree: "", Ingredients: [""], quantite: [], description: "", temps: 0))
    @StateObject var ficheViewModel = FicheViewModel(fiche: Fiche(intitule: "", responsable: "", nbCouverts: 0, categorie: "", etapes: [], materielSpes: "", materielDress: ""))
    
    
    var body: some View{
        NavigationView{
            VStack{
               
                LazyVGrid(columns: col, alignment: .leading){
                    
                    Text("Ingredient").padding()
                    
                    Picker("Ingredient", selection: $selectedIngredient){
                        ForEach(ingrsVM.ingredients, id: \.id){
                            ingred in Text(ingred.nom).tag(ingred.nom)
                        }.padding(5)
                        
                       
                    }
                    Text("Quantité").padding()
                    TextField("Quantite", value: self.$selectedquantite, formatter: formatter).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5)
                    
                    Text("Unite").padding()
                    Picker("Unite", selection: $selectedunite){
                        ForEach(ingrsVM.unites, id: \.self){
                            uniteIngr in Text(uniteIngr.type).tag(uniteIngr.type)
                        }.padding(5)
                    }
                    //Text("La quantité est \(etapeVM.Ingredients[0].1)")
                    Text("").font(.title)
                        .toolbar {
                            ToolbarItem(placement: .bottomBar) {
                                Button("Add") {
                                    etapeViewModel.Ingredients.append(selectedIngredient)
                                    etapeViewModel.quantite.append(selectedquantite)
                                    etapeViewModel.Ingredients.append(selectedunite)
                                 
                                    
                                    print("Pressed")
                                    
                                }
                            }
                        }
                   
                    
                    
                    
                
                
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

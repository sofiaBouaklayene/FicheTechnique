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

struct AddIngrSheetView: View{
    
    let formatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    let col = [GridItem](repeating: .init(.flexible()), count: 2)
    
    //@State var ingr = Ingredient( nom: "tomate", categorie: "fruit", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "cru")
    
    
    @State private var nom: String = ""
    @State private var PU: Int = 0
    @State private var qtteStock: Int = 0
    @State private var allergene: Bool = false
    @State private var CatAllergene: String = ""
    
    
    @StateObject var ingredViewModel = IngredientViewModel(ingredient: Ingredient(nom: "", categorie: "", PU: 0, unite: "", qtteStock: 0, allergene: true, CatAllergene: ""))
    
    
    
    @State private var checked = true
    @State private var selectedCategory: CatgrIngr = CatgrIngr.fruit
    @State private var selectedUnite: UniteIngr = UniteIngr.kg
    
    @ObservedObject var ingrsVM : IngrsVM
    //@ObservedObject var vmIngredient = IngredientViewModel
    
    //@ObservedObject var testVM : TestViewModel
    
    @State var prixUnitaire : Int = 0
    
    
    var body: some View{
        NavigationView{
            VStack{
                Text("Ingrédients").font(.title)
                LazyVGrid(columns: col, alignment: .leading){
                    
                    Text("Ingredient").padding()
                    TextField("Ingredient", text : $ingredViewModel.nom).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5);
                    Text("Catégorie").padding()
                    Picker("Catégorie", selection: $selectedCategory){
                        ForEach(CatgrIngr.allCases, id: \.self){
                            categorieIngr in Text(categorieIngr.rawValue).tag(categorieIngr)
                        }.padding(5)
                    }
                    .pickerStyle(.menu)
                    
                }
                LazyVGrid(columns: col, alignment: .leading){
                    Text("Prix unitaire").padding()
                    TextField("Prix unitaire", value: $ingredViewModel.PU, formatter:formatter).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5) ;
                    Text("Quantité").padding()
                    TextField("Quantite", value: $ingredViewModel.qtteStock, formatter: formatter).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5)
                    Text("Unité").padding()
                    Picker("Catégorie", selection: $selectedUnite){
                        ForEach(UniteIngr.allCases, id: \.self){
                            uniteIngr in Text(uniteIngr.rawValue).tag(uniteIngr)
                        }.padding(5)
                    }
                    .pickerStyle(.menu)
                    HStack {
                        Text("Allergène").padding()
                        CheckBoxView(checked: $checked).padding()
                        Spacer()
                    }
                }
                Button(action :{
                    self.handleAjoutTapped()
            
                  
                }, label:{
                    Text("Ajouter au stock").bold().frame(width: 300, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding()
                })
                
            }
           
        }
}
    func handleAjoutTapped(){
        self.ingredViewModel.handleAjoutTapped()
       
    }
}
struct AddIngrSheetView_Previews: PreviewProvider {
    /*static var ingredient : Ingredient = Ingredient(idIngredient: 125, nom: "truc", categorie: "fruit", PU: 2, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustaces")*/
    static var ingrsVM : IngrsVM = IngrsVM()
    
    static var previews: some View {
        AddIngrSheetView(ingrsVM: ingrsVM)
    }
}

extension AddIngrSheetView{
    private func saveIngredient(){
        let ingred = Ingredient(nom: nom, categorie: selectedCategory.rawValue, PU: PU, unite: selectedUnite.rawValue, qtteStock: qtteStock, allergene: allergene, CatAllergene: CatAllergene)
        ingrsVM.addIngredient(ingredient: ingred)
    }
}

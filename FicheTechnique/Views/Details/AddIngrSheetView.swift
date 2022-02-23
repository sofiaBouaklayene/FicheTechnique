//
//  AddIngrSheetView.swift
//  FicheTechnique
//
//  Created by m1 on 20/02/2022.
//

import Foundation
import SwiftUI
import Foundation

struct AddIngrSheetView: View{
    
    let formatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    let col = [GridItem](repeating: .init(.flexible()), count: 2)
    @State var ingr = Ingredient( nom: "tomate", categorie: "fruit", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "cru")
    @State private var checked = true
    @State private var selectedCategory: CatgrIngr = CatgrIngr.fruit
    @State private var selectedUnite: UniteIngr = UniteIngr.kg
    
    @ObservedObject var ingrsVM : IngrsVM
    //@ObservedObject var ingredient : Ingredient
    //@ObservedObject var testVM : TestViewModel
    
    var body: some View{
        NavigationView{
            VStack{
                Text("Ingrédients").font(.title)
                LazyVGrid(columns: col, alignment: .leading){
                    
                    Text("Ingredient").padding()
                    TextField("Ingredient", text : $ingr.nom).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5);
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
                    TextField("Prix unitaire", value: $ingr.PU, formatter:formatter).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5) ;
                    Text("Quantité").padding()
                    TextField("Quantite", value: $ingr.qtteStock, formatter: formatter).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5)
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
                    handleDoneTapped()
            
                  
                }, label:{
                    Text("Ajouter au stock").bold().frame(width: 300, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding()
                })
                
            }
           
        }
}
    func handleDoneTapped(){
        //testVM.save()
    }
}
struct AddIngrSheetView_Previews: PreviewProvider {
    /*static var ingredient : Ingredient = Ingredient(idIngredient: 125, nom: "truc", categorie: "fruit", PU: 2, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustaces")*/
    static var ingrsVM : IngrsVM = IngrsVM()
    static var previews: some View {
        AddIngrSheetView(ingrsVM: ingrsVM)
    }
}

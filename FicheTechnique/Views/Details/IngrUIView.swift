//
//  IngrUIView.swift
//  FicheTechnique
//
//  Created by m1 on 22/02/2022.
//


import SwiftUI
import Foundation

struct IngrUIView: View{
    @ObservedObject var ingredient : Ingredient
    @ObservedObject var ingrsVM : IngrsVM
    @State private var showingModifyIngrSheet = false
    
    var body: some View{
        VStack{
            Image(systemName: "music.mic")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding(10)
            Text("Nom de l'ingredient: \(ingredient.nom)")
                .padding(10)
            Text("Categorie de l'ingredient: \(ingredient.categorie)")
                .padding(10)
            Text("Prix de l'ingrédient: \(ingredient.PU)")
                .padding(10)
            Text("Unité: \(ingredient.unite)")
                .padding(10)
            Text("Quantité: \(ingredient.qtteStock)")
                .padding(10)
            Text("Allergène: \(ingredient.CatAllergene)")
                .padding(10)
            
            Button(action :{
                showingModifyIngrSheet.toggle()
            }, label:{
                Text("Modifier").bold().frame(width: 150, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding(5)
            }).sheet(isPresented: $showingModifyIngrSheet){
                ModifyIngrSheetView(vmIngredient : IngredientViewModel(ingredient: ingredient), ingrsVM: ingrsVM).padding(30)
            }
            
        
       
        
    }
        }
    }

struct IngrUIView_Previews: PreviewProvider {
    static var ingredient : Ingredient = Ingredient(nom: "truc", categorie: "fruit", PU: 2, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustaces")
    static var ingrsVM : IngrsVM = IngrsVM()
    static var previews: some View {
        IngrUIView(ingredient: ingredient, ingrsVM: ingrsVM)
    }
}

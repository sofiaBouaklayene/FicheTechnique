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
        }
    }
}
struct IngrUIView_Previews: PreviewProvider {
    static var ingredient : Ingredient = Ingredient(idIngredient: 125, nom: "truc", categorie: "fruit", PU: 2, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustaces")
    static var ingrsVM : IngrsVM = IngrsVM()
    static var previews: some View {
        IngrUIView(ingredient: ingredient, ingrsVM: ingrsVM)
    }
}

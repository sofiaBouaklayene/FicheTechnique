//
//  ListIngrView.swift
//  FicheTechnique
//
//  Created by m1 on 22/02/2022.
//

import SwiftUI
import Foundation

struct ListIngrView: View{
    @ObservedObject var ingredient : Ingredient
    @ObservedObject var ingrsVM : IngrsVM
    
    var body: some View{
        VStack(alignment: .leading){
            NavigationLink(destination:IngrUIView(ingredient: ingredient, ingrsVM: ingrsVM)){
                VStack(alignment: .leading){
                    Text(ingredient.nom)
                    Spacer()
                    Text(ingredient.categorie)
                
                }
            }
        }
    }
}
struct ListIngrView_Previews: PreviewProvider {
    static var ingredient : Ingredient = Ingredient(idIngredient: 125, nom: "truc", categorie: "fruit", PU: 2, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustaces")
    
    static var ingrsVM: IngrsVM = IngrsVM()
    static var previews: some View {
        ListIngrView(ingredient: ingredient, ingrsVM: ingrsVM)
    }
}

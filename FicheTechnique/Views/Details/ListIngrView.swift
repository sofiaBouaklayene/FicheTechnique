//
//  ListIngrView.swift
//  FicheTechnique
//
//  Created by m1 on 22/02/2022.
//

import SwiftUI
import Foundation
import FirebaseFirestore

struct ListIngrView: View{
    @ObservedObject var ingredient : Ingredient
    @ObservedObject var ingrsVM : IngrsVM
    //@ObservedObject var testVM : TestViewModel
    

    
    var body: some View{
        VStack(){
            NavigationLink(destination:IngrUIView(ingredient: ingredient, ingrsVM: ingrsVM)){
                VStack(alignment: .leading){
                    Text(ingredient.nom)
                    Text(ingredient.categorie)
                    //Text("\(ingredient.PU) euro")
                    //Text(ingredient.unite)
                    //Text("\($ingredient.quantite)")
                    //Text("\($ingredient.allergene)")
                    
                
                }
            }
           
        }
    }
}


struct ListIngrView_Previews: PreviewProvider {
    static var ingredient : Ingredient = Ingredient(nom: "truc", categorie: "fruit", PU: 2, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustaces")
    
    static var ingrsVM: IngrsVM = IngrsVM()
    static var previews: some View {
        ListIngrView(ingredient: ingredient, ingrsVM: ingrsVM)
    }
}

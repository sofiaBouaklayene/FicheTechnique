//
//  IngrsVM.swift
//  FicheTechnique
//
//  Created by m1 on 22/02/2022.
//

import Foundation
import SwiftUI
import Combine

class IngrsVM : ObservableObject{
    @Published var ingredients : [Ingredient] = []
    init(){
        getIngrs()
    }
    func getIngrs(){
        var newIngrs : [Ingredient] = [
            Ingredient(idIngredient: 134, nom: "tomate", categorie: "fruit", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustace"),
            Ingredient(idIngredient: 134, nom: "concombre", categorie: "fruit", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustace"),
            Ingredient(idIngredient: 134, nom: "crevette", categorie: "fruit", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustace")
        ]
        ingredients.append(contentsOf : newIngrs)
    }
    func deleteIngr(indexSet: IndexSet){
        ingredients.remove(atOffsets: indexSet)
    }
    func moveIngr(from: IndexSet, to: Int){
        ingredients.move(fromOffsets: from, toOffset : to)
    }
}

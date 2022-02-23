//
//  TestViewModel.swift
//  FicheTechnique
//
//  Created by m1 on 23/02/2022.
//

import Foundation
import Firebase
import FirebaseFirestore

class TestViewModel: ObservableObject{
    @Published var ingredient : Ingredient = Ingredient( nom: "", categorie: "", PU: 0, unite: "", qtteStock: 0, allergene: true, CatAllergene: "")
    //private let firestore = Firestore.firestore()
    private var db = Firestore.firestore()
    
    /*func addIngredient(ingredient : Ingredient){
        do {
            let _ = try db.collection("ingredients").addDocument(from: ingredient)
        }
        catch{
            print(error)
        }
    }
    func save()
    {
        addIngredient(ingredient: ingredient)
    }
    func getIngredient() async{
      let data = try? await
    firestore.collection("ingredients").getDocuments()
    }*/
}

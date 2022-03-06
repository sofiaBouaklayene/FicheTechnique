//
//  IngrModel.swift
//  FicheTechnique
//
//  Created by m1 on 06/03/2022.
//

import Foundation
import Foundation
import SwiftUI
import Combine
import Firebase
import FirebaseFirestore

class IngrFicheVM : ObservableObject{
    @Published var ingredsFiche : [ModelIngredFiche] = []
   
    init(){
        getIngredsFiche()
       
    }
    func getIngredsFiche() {
        //var listeIng : [Ingredient] = []
        let db = Firestore.firestore()
        db.collection("ModeleIngredient").addSnapshotListener { (querySnapshot, error) in
                    guard let documents = querySnapshot?.documents else {
                        print("No documents")
                        return
                    }
            self.ingredsFiche = documents.map {(queryDocumentSnapshot) -> ModelIngredFiche in
                    //print("\(document.documentID) => \(document.data())")
                    let d = queryDocumentSnapshot.data()
                let nom = d["nom"] as? String ?? ""
                let quantite = d["quantite"] as? Int ?? 0
                
                
                    //listeIng.append(Ingredient( nom: nom, categorie: "fruit", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustace"))
                    return  ModelIngredFiche(nomingredient: nom, quantite: quantite)
                
                    
                    
                }
            }
        }
}

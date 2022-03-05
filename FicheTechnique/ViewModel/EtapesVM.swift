//
//  EtapesVM.swift
//  FicheTechnique
//
//  Created by m1 on 03/03/2022.
//

import Foundation
import SwiftUI
import Combine
import Firebase
import FirebaseFirestore

class EtapesVM : ObservableObject{
    @Published var etapes = [Etape]()
    init(){
    
        getAllEtapes()
       
    }
    func getAllEtapes() {
        //var listeIng : [Ingredient] = []
        let db = Firestore.firestore()
        db.collection("Etape").addSnapshotListener { (querySnapshot, error) in
                    guard let documents = querySnapshot?.documents else {
                        print("No documents")
                        return
                    }
            self.etapes = documents.map {(queryDocumentSnapshot) -> Etape in
                    //print("\(document.documentID) => \(document.data())")
                    let d = queryDocumentSnapshot.data()
                let titreEtape = d["titreEtape"] as? String ?? ""
                let NomDenree = d["NomDenree"] as? String ?? ""
                let Ingredients = d["Ingredients"] as? [(String, Int)] ?? [("", 0)]
                //let etapes = d["etape"] as? [Etape]
                let description = d["description"] as? String ?? ""
                let temps = d["temps"] as? Int ?? 0
                    //listeIng.append(Ingredient( nom: nom, categorie: "fruit", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustace"))
                    return Etape(titreEtape: titreEtape, NomDenree: NomDenree, Ingredients: Ingredients, description: description, temps: temps)
                
                    
                    
                }
            }
        }
   
  
      
     
    
  
    /*func getAllEtapes(){
            //var listeIng : [Ingredient] = []
            let db = Firestore.firestore()
            db.collection("Etape").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let d = document.data()
                        let titreEtape = d["titreEtape"] as? String ?? ""
                        let NomDenree = d["NomDenree"] as? String ?? ""
                        let Ingredients = d["Ingredients"] as? [(String, Int)] ?? [("", 0)]
                        //let etapes = d["etape"] as? [Etape]
                        let description = d["description"] as? String ?? ""
                        let temps = d["temps"] as? Int ?? 0
                       
                        let etape = Etape(titreEtape: titreEtape, NomDenree: NomDenree, Ingredients: Ingredients, description: description, temps: temps)
                        print(etape)
                       
                    }
                    
                }
            }
          
        }*/
    
}

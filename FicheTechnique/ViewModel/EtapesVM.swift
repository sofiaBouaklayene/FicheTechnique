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
    @Published var ficheEtape = [Etape]()
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
                let idEtape = queryDocumentSnapshot.documentID
                let titreEtape = d["titreEtape"] as? String ?? ""
                let NomDenree = d["NomDenree"] as? String ?? ""
                let Ingredients = d["Ingredients"] as? [String] ?? [""]
                let quantite = d["quantite"] as? [Int] ?? []
                //let etapes = d["etape"] as? [Etape]
                let description = d["description"] as? String ?? ""
                let temps = d["temps"] as? Int ?? 0
                print(Ingredients)
                    //listeIng.append(Ingredient( nom: nom, categorie: "fruit", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustace"))
                //print("l'id est " + idEtape)
                return Etape(titreEtape: titreEtape, NomDenree: NomDenree, Ingredients: Ingredients, quantite: quantite, description: description, temps: temps, inputidStr: idEtape)
                
                    
                    
                }
            }
        }
    func getetapes( etapesIn : [String]) -> [Etape] {
        var resultat : [Etape] = []
        for etapeIn in etapesIn{
            print("l'etape est :" + etapeIn)
            for etape in self.etapes{
                if etape.id.uuidString == etapeIn{
                    
                    resultat.append(etape)
                }
            }
        }
        return resultat
        }
    
    func deleteEtape(indexSet: IndexSet){
        etapes.remove(atOffsets: indexSet)
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

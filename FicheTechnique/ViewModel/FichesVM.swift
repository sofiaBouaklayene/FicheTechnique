//
//  FichesVM.swift
//  FicheTechnique
//
//  Created by m1 on 23/02/2022.
//

import Foundation
import SwiftUI
import Combine
import Firebase
import FirebaseFirestore

class FichesVM : ObservableObject{
    @Published var fiches : [Fiche] = []
    @Published var categories = [CategorieFiche]()
    init(){
        //getFiches()
        //fetchData()
        getAllFiches()
        getAllFicheCat()
       
    }
    /*func getFiches(){
        let newFiches : [Fiche] = [
            Fiche(intitule: "Pizza", responsable: "Alizee", nbrCouverts: 3, categorie: "plat", etapes: [Etape(titreEtape: "1 ere ", NomDenree: "truc", Ingredients: [("Fraise", 5)], description: "truc", temps: 3)], materielSpes: "couteau", materielDress: "fourchette"),
            Fiche(intitule: "Pates", responsable: "Clement", nbrCouverts: 4, categorie: "plat", etapes: [Etape(titreEtape: " Ceci est le titre de l'étape ", NomDenree: "ceci est le denrée", Ingredients: [("Tomate", 5),("Concombre", 3)], description: " description de la premiere etape", temps: 3), Etape(titreEtape: " Ceci est le titre de la seconde etape", NomDenree: "Nom denree", Ingredients: [("crevette", 3), ("vermisselle", 2)], description: "description de la 2 eme etape", temps: 2)], materielSpes: "couteau", materielDress: "fourchette")
            
            
        
        ]
        fiches.append(contentsOf : newFiches)
       
    }*/
    func deleteFiche(indexSet: IndexSet){
        fiches.remove(atOffsets: indexSet)
    }
    func moveFiche(from: IndexSet, to: Int){
        fiches.move(fromOffsets: from, toOffset : to)
    }
    func addFiche(fiche: Fiche){
        fiches.append(fiche)
    }
    
    func deleteFiche(with id: UUID){
        let db = Firestore.firestore()
        db.collection("Fiche").whereField("id", isEqualTo: id).getDocuments{(snap, err) in
        if err != nil {
            print("error")
            return
        }
        for i in snap!.documents{
            DispatchQueue.main.async{
                i.reference.delete()
            }
        
        }
        }
    }
    /*func fetchData(){
        let db = Firestore.firestore()
        db.collection("Fiche").addSnapshotListener{
            (data, error) in
            guard let documents = data?.documents else {
                return // no document
            }
            self.fiches = documents.compactMap{ (doc) ->
                Fiche? in
                print(self)
                return try? doc.data(as: Fiche.self)
             
                
                
                    }
            }
    }*/
    
    /*func getAllFiches(){
            //var listeIng : [Ingredient] = []
            let db = Firestore.firestore()
            db.collection("Fiche").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let d = document.data()
                        let categorie = d["categorie"] as? String ?? ""
                        let responsable = d["responsable"] as? String ?? ""
                        let nbrCouverts = d["nbrCouverts"] as? Int ?? 0
                        let etapes = d["etape"] as? [Etape] ?? [Etape(titreEtape: "", NomDenree: "", Ingredients: [("", 0)], description: "", temps: 0)]
                        let intitule = d["intitule"] as? String ?? ""
                        let materielDress = d["materielDress"] as? String ?? ""
                        let materielSpes = d["materielSpes"] as? String ?? ""
                        
                        let fiche = Fiche(intitule: intitule, responsable: responsable, nbrCouverts: nbrCouverts, categorie: categorie, etapes: etapes, materielSpes: materielSpes, materielDress: materielDress)
                        
                       
                    }
                    
                }
            }
          
        }*/
    func getAllFiches() {
        //var listeIng : [Ingredient] = []
        let db = Firestore.firestore()
        db.collection("Fiche").addSnapshotListener { (querySnapshot, error) in
                    guard let documents = querySnapshot?.documents else {
                        print("No documents")
                        return
                    }
            self.fiches = documents.map {(queryDocumentSnapshot) -> Fiche in
                    //print("\(document.documentID) => \(document.data())")
                    let d = queryDocumentSnapshot.data()
                let categorie = d["categorie"] as? String ?? ""
                let responsable = d["responsable"] as? String ?? ""
                let nbCouverts = d["nbCouverts"] as? Int ?? 0
                let etapes = d["etapes"] as? [String] ?? []
                let intitule = d["intitule"] as? String ?? ""
                let materielDress = d["materielDress"] as? String ?? ""
                let materielSpes = d["materielSpes"] as? String ?? ""
                
                    //listeIng.append(Ingredient( nom: nom, categorie: "fruit", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustace"))
                    return  Fiche(intitule: intitule, responsable: responsable, nbCouverts: nbCouverts, categorie: categorie, etapes: etapes, materielSpes: materielSpes, materielDress: materielDress)
                
                    
                    
                }
            }
        }
    
    
  
    
    
    func getAllFicheCat(){
        
        let db = Firestore.firestore()
        db.collection("CategorieFiche").addSnapshotListener { (querySnapshot, error) in
                    guard let documents = querySnapshot?.documents else {
                        print("No documents")
                        return
                    }
            self.categories = documents.map {(queryDocumentSnapshot) -> CategorieFiche in
                    //print("\(document.documentID) => \(document.data())")
                    let d = queryDocumentSnapshot.data()
                let type = d["type"] as? String ?? ""
                return  CategorieFiche(type : type)
                
                    
                    
                }
            }
        
    }
   
    
    
    
   
    /*func fetchOrder() {
        let db = Firestore.firestore()
        db.collection("Fiche")
            .addSnapshotListener { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    guard let documents = querySnapshot?.documents else {
                        print("no documents")
                        return
                    }
                    self.fiches = documents
                        .flatMap { document -> Fiche in
                            return try! (document.data(as: Fiche.self)! ?? "")!
                        }
                }
            }
    }*/
}


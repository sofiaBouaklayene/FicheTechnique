//
//  IngrsVM.swift
//  FicheTechnique
//
//  Created by m1 on 22/02/2022.
//

import Foundation
import SwiftUI
import Combine
import FirebaseFirestore
import Firebase

class IngrsVM : ObservableObject, Subscriber{
    @Published var ingredients = [Ingredient]()
    @Published var categories = [CatIngr]()
    //@Published var liveIngrs = [Ingredient]()
    //@Published var ingredient: Ingredient
    //@Published var cancellables = Set<AnyCancellable>()
    //@Published var modified = false
    //@ObservedObject var ingrVM : IngredientViewModel
    init(){
        getAllCategorys()
        getAllIngredients()
        
    
    }
    /*func getIngrs(){
        let newIngrs : [Ingredient] = [
            Ingredient( nom: "tomate", categorie: "fruit", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustace"),
            Ingredient( nom: "concombre", categorie: "legume", PU: 1, unite: "kg", qtteStock: 6, allergene: false, CatAllergene: "crustace"),
            Ingredient( nom: "crevette", categorie: "poisson", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustace")
        ]
        //ingrVM.getAllIngredients()
        ingredients.append(contentsOf : newIngrs)
    }*/
    /*func getLiveIngr(){
        liveIngrs = getAllIngredients()

        
    }*/
    
    // Mark: - Fonctions de base
      
    func deleteIngr(indexSet: IndexSet){
        ingredients.remove(atOffsets: indexSet)
    }
    
    
    
    
    func moveIngr(from: IndexSet, to: Int){
        ingredients.move(fromOffsets: from, toOffset : to)
    }
    func addIngredient(ingredient: Ingredient){
        ingredients.append(ingredient)
    }
    
    
    
    
    
    /*private var db = Firestore.firestore()
    func addIngredient(_ ingredient : Ingredient){
        do{
            let _ = try db.collection("ingredients").addDocument(from: ingredient)
        }
        catch{
            print(error)
        }
    }
    
    // Mark: - Model Management
    
    func save(){
        addIngredient(self.ingredient)
    }
    // Mark: -UI handlers
    
    func handleAjoutTapped(){
        self.save()
    }*/
    
    
    typealias Input = IngredientListState
    typealias Failure = Never
    func receive(subscription : Subscription){
        subscription.request(.unlimited)
    }
    
    func receive(completion : Subscribers.Completion<Never>){
        return
    }
    func receive(_ input: Input)->Subscribers.Demand{
        switch input{
        case .ready : break
        case .listUpdated:
            print("list updated !")
            self.objectWillChange.send()
        }
        return .none
    }
    func getAllIngredients() {
        //var listeIng : [Ingredient] = []
        let db = Firestore.firestore()
        db.collection("ingredients").addSnapshotListener { (querySnapshot, error) in
                    guard let documents = querySnapshot?.documents else {
                        print("No documents")
                        return
                    }
            self.ingredients = documents.map {(queryDocumentSnapshot) -> Ingredient in
                    //print("\(document.documentID) => \(document.data())")
                    let d = queryDocumentSnapshot.data()
                    let nom = d["nom"] as? String ?? ""
                    let categorie = d["categorie"] as? String ?? ""
                    let PU = d["PU"] as? Int ?? 0
                    let unite = d["unite"] as? String ?? ""
                    let qtteStock = d["qtteStock"] as? Int ?? 0
                    let allergene = d["allergene"] as? Bool ?? false
                    let CatAllergene = d["CatAllergene"] as? String ?? ""
                    //listeIng.append(Ingredient( nom: nom, categorie: "fruit", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustace"))
                    return Ingredient(nom: nom, categorie: categorie, PU: PU, unite: unite, qtteStock: qtteStock, allergene: allergene, CatAllergene: CatAllergene)
                    
                    
                }
            }
        }
    /*func getAllCategories(){
            //var listeIng : [Ingredient] = []
            let db = Firestore.firestore()
            db.collection("CategorieIngredient").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let d = document.data()
                        let type = d["type"] as? String ?? ""
                        let categorie = CatIngr(type: type)
                        print(categorie)
                       
                    }
                    
                }
            }
          
        }*/
    func getAllCategorys(){
        let db = Firestore.firestore()
        db.collection("CategorieIngredient").addSnapshotListener { (querySnapshot, error) in
                    guard let documents = querySnapshot?.documents else {
                        print("No documents")
                        return
                    }
            self.categories = documents.map {(queryDocumentSnapshot) -> CatIngr in
                    print("\(queryDocumentSnapshot.documentID) => \(queryDocumentSnapshot.data())")
                    let d = queryDocumentSnapshot.data()
                    let type = d["type"] as? String ?? ""
                    //listeIng.append(Ingredient( nom: nom, categorie: "fruit", PU: 1, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustace"))
                return CatIngr(type: type)
                    
                    
                }
            }
        
    }
    
    func deleteData(toDoDeleteIngr : Ingredient){
        let db = Firestore.firestore()
        db.collection("ingredients").document(toDoDeleteIngr.id).delete{
            error in
            if error == nil{
                DispatchQueue.main.async{
                    self.ingredients.removeAll{
                        ingred in
                        return ingred.id == toDoDeleteIngr.id
                        
                    }
                }
                
            }
        }
    }
    func deleteIngred(with id: String){
        let db = Firestore.firestore()
        /*db.collection("ingredients").whereField("id", isEqualTo: id).getDocuments{(snap, err) in
        if err != nil {
            print("error")
            return
        }
        for i in snap!.documents{
            DispatchQueue.main.async{
                i.reference.delete()
            }
        
        }
        }*/
        db.collection("ingredients").document(id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
                print(id)
            }
        }
                                                                                
    }
      
    }



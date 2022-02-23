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
    //@Published var liveIngrs = [Ingredient]()
    
    //@ObservedObject var ingrVM : IngredientViewModel
    init(){
        //getIngrs()
        
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
    
    func deleteIngr(indexSet: IndexSet){
        ingredients.remove(atOffsets: indexSet)
    }
    func moveIngr(from: IndexSet, to: Int){
        ingredients.move(fromOffsets: from, toOffset : to)
    }
    func addIngr(ingredient : Ingredient){
        
    }
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
      
    }



//
//  IngredientViewModel.swift
//  FicheTechnique
//
//  Created by m1 on 22/02/2022.
//
import SwiftUI
import Foundation
import Combine
import FirebaseFirestore
import Firebase

class IngredientViewModel : ObservableObject, IngredientObserver, Subscriber {
    
    private var modelIngr : Ingredient
    
    //@Published  var idIngredient: Int
    @Published var nom: String
    @Published var categorie: String
    @Published var PU: Int
    @Published var unite: String
    @Published var qtteStock: Int
    @Published var error : IngredientError = .noError
    
    
    init(ingredient : Ingredient){
        self.modelIngr = ingredient
        //self.idIngredient = ingredient.idIngredient
        self.nom = ingredient.nom
        self.categorie = ingredient.categorie
        self.PU = ingredient.PU
        self.unite = ingredient.unite
        self.qtteStock = ingredient.qtteStock
        ingredient.observer = self
    }
    // MARK: -
    // MARK: TrackObserver
    
    func change(name: String){
        print("vm observer : name changed => self.name = '\(name)'")
        self.nom = name
    }
    
    typealias Input = IngredientState
    typealias Failure = Never
    //appelée à l'inscription
    func receive(subscription: Subscription) {
        subscription.request(.unlimited) //unlimited : on veut recevoir toutes les valeurs
    }
    
    //au cas où le publisher déclare qu'il finit d'émettre : nous concerne pas
    func receive(completion: Subscribers.Completion<Never>) {
        return
    }
    
    //activée à chaque send() du publisher
    func receive(_ input: Input) -> Subscribers.Demand {
        print("vm => intent \(input)")
        switch input{
        case .ready : break
        case .changingName(let name) :
            print("vm : change model name to \(self.modelIngr.nom)")
            self.modelIngr.nom = name
            if nom != self.modelIngr.nom {
                print("vm : error detected => set vm error")
                self.error = .tooShortName
                self.nom = self.modelIngr.nom
                print("vm : error detected => self.trackName = '\(self.modelIngr.nom)'")
            }
        case .nameChanged(_) : break
        }
        return .none // on arrête de traiter cette demande et on attend un nouveau send
    }
   
   
    
    
}

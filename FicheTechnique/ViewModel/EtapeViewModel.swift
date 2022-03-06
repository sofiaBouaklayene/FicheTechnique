//
//  EtapeViewModel.swift
//  FicheTechnique
//
//  Created by m1 on 04/03/2022.
//


import SwiftUI
import Foundation
import Combine
import FirebaseFirestore
import Firebase
import simd

class EtapeViewModel : ObservableObject {
    
    private var modelEtape : Etape
    
    
    @Published var titreEtape: String
    @Published var NomDenree: String
    @Published var Ingredients: [String]
    @Published var description: String
    @Published var temps: Int
    
    
   
    
    
    init(etape : Etape){
        self.modelEtape = etape
        self.titreEtape = etape.titreEtape
        self.NomDenree = etape.NomDenree
        self.Ingredients = etape.Ingredients
        self.description = etape.description
        self.temps = etape.temps
       
      
        
        
    }
    
    func addEtape(){
        let db = Firestore.firestore()
        let etape : Etape = Etape(titreEtape: titreEtape, NomDenree: NomDenree, Ingredients: Ingredients, description: description, temps: temps)
        
        do {
            let _ = try db.collection("Etape").document(etape.id.uuidString ).setData(["titreEtape" : titreEtape, "NomDenree" : NomDenree, "Ingredients": Ingredients  ,"description" : description, "temps": temps ])
            
            }
            catch {
              print(error)
            }
        
    }
    
    
    func save() {
        addEtape()
      }
    
    func handleAjoutTapped() {
        self.save()
        
      }
   
  
    /*
    func addEtapeToFiche(){
        let newStep : Etape = Etape(titreEtape: etapes.titre, NomDenree: etapes.NomDenree, Ingredients: etapes.Ingredients, description: etapes.description, temps: etapes.temps)
        etapes.append(contentsOf: newStep)
        
        
    }
    func add(){
        fiche.add(listeEtape)
    }
     je cree listeetape qui contient tous les titre dure ... que je recupere de mon fronte
     et je l'ajoute a mon fichevm
     */
}

//
//  FicheViewModel.swift
//  FicheTechnique
//
//  Created by m1 on 03/03/2022.
//

import SwiftUI
import Foundation
import Combine
import FirebaseFirestore
import Firebase
import simd

class FicheViewModel : ObservableObject {
    
    private var modelFiche : Fiche
    
    
    @Published var intitule: String
    @Published var responsable: String
    @Published var nbCouverts: Int
    @Published var  categorie: String
    @Published var  etapes: [String]
    @Published var materielSpes: String
    @Published var materielDress: String
    
    
   
    
    
    init(fiche : Fiche){
        self.modelFiche = fiche
        self.intitule = fiche.intitule
        self.responsable = fiche.responsable
        self.nbCouverts = fiche .nbCouverts
        self.categorie = fiche.categorie
        self.etapes = fiche.etapes
        self.materielSpes = fiche.materielSpes
        self.materielDress = fiche.materielDress
      
        
        
    }
    func addFiche(){
        let db = Firestore.firestore()
        let fiche : Fiche = Fiche(intitule: intitule, responsable: responsable, nbCouverts: nbCouverts, categorie: categorie, etapes: etapes, materielSpes: materielSpes, materielDress: materielDress)
        
        do {
            let _ = try db.collection("Fiche").document(fiche.id.uuidString ).setData(["intitule" : intitule, "responsable" : responsable, "nbCouverts" : nbCouverts,"categorie" : categorie, "etapes" : etapes, "materielSpes": materielSpes, "materielDress": materielDress ])
            //let etape = db.collection("Etapr").document()
        
            }
            catch {
              print(error)
            }
    }
    func save() {
        addFiche()
      }
    
    func handleAjoutTapped() {
        self.save()
      }
  
    /*func addEtapeToFiche(){
        let newStep : Etape = Etape(titreEtape: etapes.titre, NomDenree: etapes.NomDenree, Ingredients: etapes.Ingredients, description: etapes.description, temps: etapes.temps)
        etapes.append(contentsOf: newStep)
        
        
    }*/
    /*
    func add(){
        fiche.add(listeEtape)
    }
     je cree listeetape qui contient tous les titre dure ... que je recupere de mon fronte
     et je l'ajoute a mon fichevm
     */
}

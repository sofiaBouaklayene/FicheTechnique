//
//  Fiche.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
import SwiftUI

class Fiche: Identifiable, ObservableObject{
    
  /*enum CodingKeys: String, CodingKey{
        case intitule
        case responsable
        case nbrCouverts
        case categorie
        case etapes
        
        case materielSpes
        case materielDress
    }*/
  
    
    
    var id =  UUID()
    let intitule: String
    let responsable: String
    let nbCouverts: Int
    let categorie: String
    let etapes: [String]
    let materielSpes: String
    let materielDress: String
    
    init( intitule: String, responsable:String, nbCouverts: Int, categorie: String, etapes: [String], materielSpes: String, materielDress: String) {
        self.intitule = intitule
        self.responsable = responsable
        self.nbCouverts = nbCouverts
        self.categorie = categorie
        self.etapes = etapes
        self.materielSpes = materielSpes
        self.materielDress = materielDress
    }
   
    
}


//
//  Fiche.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
import SwiftUI

enum Categorie: String, CaseIterable{
    case dessert = "Dessert"
    case plat = "Plat"
    case entree = "Entree"
}

class Fiche: Identifiable, ObservableObject{
    //var id: ObjectIdentifier
    
    let id = UUID()
    let intitule: String
    let responsable: String
    let nbrCouverts: Int
    let categorie: Categorie.RawValue
    let etape: [Etape]
    let materielSpes: String
    let materielDress: String
    
    init( intitule: String, responsable:String, nbrCouverts: Int, categorie: String, etape: [Etape], materielSpes: String, materielDress: String) {
        self.intitule = intitule
        self.responsable = responsable
        self.nbrCouverts = nbrCouverts
        self.categorie = categorie
        self.etape = etape
        self.materielSpes = materielSpes
        self.materielDress = materielDress
    }
    
}

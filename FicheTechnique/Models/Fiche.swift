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

struct Fiche: Identifiable{
    //var id: ObjectIdentifier
    
    let id = UUID()
    let intitule: String
    let responsable: String
    let nbrCouverts: Int
    let categorie: Categorie.RawValue
    let etape: [Etape]
    let materielSpes: String
    let materielDress: String
    
}

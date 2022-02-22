//
//  Etape.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
struct Etape: Identifiable{
    //var id: ObjectIdentifier
    
    let id = UUID()
    let titreEtape: String
    let NomDenree: String
    let Ingredients: [ModelIngredFiche]
    let description: String
    let temps: Int
    
}

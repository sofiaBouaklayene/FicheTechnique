//
//  ModelIngredFiche.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
class ModelIngredFiche : Identifiable{
    
    let id = UUID()
    let nomingredient: String
    let quantite: Int
    
    
    init(nomingredient : String, quantite: Int){
        self.nomingredient = nomingredient
        self.quantite = quantite
       
    }
    
}

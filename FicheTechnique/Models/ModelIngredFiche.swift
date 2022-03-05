//
//  ModelIngredFiche.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
import SwiftUI

class ModelIngredFiche : Identifiable{
    
    /*enum CodingKeys: String, CodingKey{
        case nomIngredient
        case quantite
       
    }*/
    
    let id = UUID()
    var nomingredient: String
    var quantite: Int
    
    
    init(nomingredient : String, quantite: Int){
        self.nomingredient = nomingredient
        self.quantite = quantite
       
    }
    
    
}

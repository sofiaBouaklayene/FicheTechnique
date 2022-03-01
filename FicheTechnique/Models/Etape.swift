//
//  Etape.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
class Etape: Identifiable,  ObservableObject{
    //var id: ObjectIdentifier
    
    let id = UUID()
    var titreEtape: String
    let NomDenree: String
    let Ingredients: [ModelIngredFiche]
    var description: String
    let temps: Int
    
    init( titreEtape: String, NomDenree:String, Ingredients: [ModelIngredFiche], description: String, temps: Int) {
        self.titreEtape = titreEtape
        self.NomDenree = NomDenree
        self.Ingredients = Ingredients
        self.description = description
        self.temps = temps
       
    }
    
}

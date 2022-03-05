//
//  Etape.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
import SwiftUI

class Etape: Identifiable,  ObservableObject{
    
    /*enum CodingKeys: String, CodingKey{

        case titreEtape
        case NomDenree
        case Ingredients
        case description
        case temps
     */
    
    var id = UUID()
    var titreEtape: String
    var NomDenree: String
    var Ingredients: [(nom: String, quantite: Int)]
    var description: String
    var temps: Int
    
    init(titreEtape: String, NomDenree:String, Ingredients: [(nom: String, quantite: Int)], description: String, temps: Int) {
        self.titreEtape = titreEtape
        self.NomDenree = NomDenree
        self.Ingredients = Ingredients
        self.description = description
        self.temps = temps
       
    }
    
}

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
    var Ingredients: [String]
    var description: String
    var temps: Int
    
    init(titreEtape: String, NomDenree:String, Ingredients: [String], description: String, temps: Int) {
        self.titreEtape = titreEtape
        self.NomDenree = NomDenree
        self.Ingredients = Ingredients
        self.description = description
        self.temps = temps
        
       
    }
    
    init(titreEtape: String, NomDenree:String, Ingredients: [String], description: String, temps: Int ,inputidStr: String){
        
        self.titreEtape = titreEtape
        self.NomDenree = NomDenree
        self.Ingredients = Ingredients
        self.description = description
        self.temps = temps
        let temp = UUID(uuidString : inputidStr)
        if (temp != nil){

            self.id = temp!
        }
    }
    
}

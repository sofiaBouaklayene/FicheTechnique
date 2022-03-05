//
//  Ingredient.swift
//  FicheTechnique
//
//  Created by m1 on 20/02/2022.
//

import Foundation
import SwiftUI

protocol IngredientObserver{
    func change(name: String)
}

class Ingredient : ObservableObject, Identifiable, Encodable{
    
    enum CodingKeys : String, CodingKey{
        case nom
        case categorie
        case PU
        case unite
        case qtteStock
        
        case allergene
        case CatAllergene
    }
    
    public var observer : IngredientObserver?
    
    
    var id: String = UUID().uuidString
    //public var idIngredient: Int
    public var nom: String
    public var categorie: String
    public var PU: Int
    public var unite: String
    public var qtteStock: Int
    
    public var allergene : Bool
    public var CatAllergene: String
    
    init(nom: String, categorie:String, PU: Int, unite: String, qtteStock: Int, allergene: Bool, CatAllergene: String) {
        //self.idIngredient = idIngredient
        self.nom = nom
        self.categorie = categorie
        self.PU = PU
        self.unite = unite
        self.qtteStock = qtteStock
        
        self.allergene = allergene
        self.CatAllergene = CatAllergene
    }
}


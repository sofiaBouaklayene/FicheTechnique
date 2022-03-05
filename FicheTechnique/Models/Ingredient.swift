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
enum CatgrIngr: String, CaseIterable{
    case poisson = "Poisson"
    case viande = "Viande"
    case cremerie = "Crèmerie"
    case epicerie = "Epicerie"
    case crustacé = "Crustaces"
    case fruit = "Fruit"
}
enum UniteIngr: String, CaseIterable{
case kg = "Kg"
case l = "L"
case botte = "Botte"
case unite = "U"
case piece = "P"
    
}

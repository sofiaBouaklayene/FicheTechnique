//
//  IngredientError.swift
//  FicheTechnique
//
//  Created by m1 on 22/02/2022.
//

import Foundation

enum IngredientError : Error, Equatable, CustomStringConvertible{
    case noError
    case tooShortName
    
    var description : String{
        switch self{
        case .tooShortName:
            return "L'ingredient doit comporter au moins 1 caractere"
        default:
            return "Erreur méconnue"
        }
    }
}

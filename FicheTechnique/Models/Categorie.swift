//
//  Categorie.swift
//  FicheTechnique
//
//  Created by m1 on 02/03/2022.
//

import Foundation
struct CatIngr : Identifiable, Hashable, Codable{
    var id: String = UUID().uuidString
    var type : String
    
}

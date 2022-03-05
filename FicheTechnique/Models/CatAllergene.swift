//
//  Allergene.swift
//  FicheTechnique
//
//  Created by m1 on 05/03/2022.
//

import Foundation
struct  CatAllaergene: Identifiable, Hashable, Codable{
    var id: String = UUID().uuidString
    var type : String
    
    
}

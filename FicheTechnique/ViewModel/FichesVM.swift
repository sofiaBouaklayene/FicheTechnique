//
//  FichesVM.swift
//  FicheTechnique
//
//  Created by m1 on 23/02/2022.
//

import Foundation
import SwiftUI
import Combine

class FichesVM : ObservableObject{
    @Published var fiches : [Fiche] = []
    init(){
        getFiches()
    }
    func getFiches(){
        let newFiches : [Fiche] = [
            Fiche(intitule: "Pizza", responsable: "Alizee", nbrCouverts: 3, categorie: "plat", etape: [Etape(titreEtape: "1 ere ", NomDenree: "truc", Ingredients: [ModelIngredFiche(nomingredient: "tomate", quantite: 2)], description: "truc", temps: 3)], materielSpes: "couteau", materielDress: "fourchette"),
            Fiche(intitule: "Pates", responsable: "clement", nbrCouverts: 4, categorie: "plat", etape: [Etape(titreEtape: "1 ere ", NomDenree: "truc", Ingredients: [ModelIngredFiche(nomingredient: "tomate", quantite: 2)], description: "truc", temps: 3)], materielSpes: "couteau", materielDress: "fourchette")
            
            
        
        ]
        fiches.append(contentsOf : newFiches)
    }
    func deleteFiche(indexSet: IndexSet){
        fiches.remove(atOffsets: indexSet)
    }
    func moveFiche(from: IndexSet, to: Int){
        fiches.move(fromOffsets: from, toOffset : to)
    }
}

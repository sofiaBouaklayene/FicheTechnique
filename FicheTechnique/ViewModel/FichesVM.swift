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
            Fiche(intitule: "Pizza", responsable: "Alizee", nbrCouverts: 3, categorie: "plat", etapes: [Etape(titreEtape: "1 ere ", NomDenree: "truc", Ingredients: [ModelIngredFiche(nomingredient: "tomate", quantite: 2)], description: "truc", temps: 3)], materielSpes: "couteau", materielDress: "fourchette"),
            Fiche(intitule: "Pates", responsable: "Clement", nbrCouverts: 4, categorie: "plat", etapes: [Etape(titreEtape: " Ceci est le titre de l'étape ", NomDenree: "ceci est le denrée", Ingredients: [ModelIngredFiche(nomingredient: "Echalotte", quantite: 2), ModelIngredFiche(nomingredient: "Concombre", quantite: 3)], description: " description de la premiere etape", temps: 3), Etape(titreEtape: " Ceci est le titre de la seconde etape", NomDenree: "Nom denree", Ingredients: [ModelIngredFiche(nomingredient: "crevette", quantite: 3)], description: "description de la 2 eme etape", temps: 2)], materielSpes: "couteau", materielDress: "fourchette")
            
            
        
        ]
        fiches.append(contentsOf : newFiches)
    }
    func deleteFiche(indexSet: IndexSet){
        fiches.remove(atOffsets: indexSet)
    }
    func moveFiche(from: IndexSet, to: Int){
        fiches.move(fromOffsets: from, toOffset : to)
    }
    func addFiche(fiche: Fiche){
        fiches.append(fiche)
    }
}

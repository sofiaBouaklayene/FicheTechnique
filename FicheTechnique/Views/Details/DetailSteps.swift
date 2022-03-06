//
//  DetailSteps.swift
//  FicheTechnique
//
//  Created by m1 on 05/03/2022.
//

//
//  FicheUIView.swift
//  FicheTechnique
//
//  Created by m1 on 24/02/2022.
//


import SwiftUI
import Foundation
import Firebase
import FirebaseFirestore

struct DetailSteps: View{
    
    @ObservedObject var etape : Etape
    @ObservedObject var etapeVM : EtapesVM
    
    //var fiche : Fiche

    
    var body: some View{
        List{
            VStack{
                Text(" \(etape.description)").bold()
                    .padding(10).font(.system(.title, design : .serif))
                Text("\(etape.titreEtape)").bold()
                    .padding(10).font(.system(.title, design : .serif))
                Text("\(etape.temps)").bold()
                    .padding(10).font(.system(.title, design : .serif))
            }
           
                
        }.font(.footnote)
                .foregroundColor(Color.gray)
    }
}

/*
struct FicheUIView_Previews: PreviewProvider {
    static var fiche : Fiche =  Fiche(intitule: "pates", responsable: "clement", nbrCouverts: 4, categorie: "plat", etapes: [Etape(titreEtape: "1 ere ", NomDenree: "truc", Ingredients: [ModelIngredFiche(nomingredient: "tomate", quantite: 2)], description: "truc", temps: 3)], materielSpes: "couteau", materielDress: "fourchette")
    static var fichesVM : FichesVM = FichesVM()
    static var previews: some View {
        FicheUIView(fichesVM : fichesVM, fiche: fiche)
    }
}
*/


//
//  ListeFicheView.swift
//  FicheTechnique
//
//  Created by m1 on 23/02/2022.
//

import SwiftUI
import Foundation

struct ListFicheView: View{
    @ObservedObject var fichesVM : FichesVM
    @ObservedObject var fiche : Fiche
    @State private var search : String = ""
    
    var body: some View{
        HStack(alignment: .center) {
               VStack(alignment: .leading) {
                   Text(fiche.intitule)
                       .font(.system(size: 30, weight: .bold, design: .default))
                       .foregroundColor(.white).padding(10)
                   Text(fiche.responsable)
                       .font(.system(size: 16, weight: .bold, design: .default))
                       .foregroundColor(.gray).padding(10)
                   HStack {
                       Text(fiche.categorie)
                           .font(.system(size: 16, weight: .bold, design: .default))
                           .foregroundColor(.white)
                           .padding(10)
                   }
               }.padding(.trailing, 20)
            Spacer(minLength: 0.25)
   
    } .frame(maxWidth: .infinity, alignment: .center)
            .background(Color(red: 32/255, green: 36/255, blue: 38/255))
            .modifier(CardModifier())
            .padding(.all, 10)
            
    }
}


struct ListFicheView_Previews: PreviewProvider {
    static var fichesVM : FichesVM = FichesVM()
    static var fiche : Fiche =  Fiche(intitule: "pates", responsable: "clement", nbrCouverts: 4, categorie: "plat", etape: [Etape(titreEtape: "1 ere ", NomDenree: "truc", Ingredients: [ModelIngredFiche(nomingredient: "tomate", quantite: 2)], description: "truc", temps: 3)], materielSpes: "couteau", materielDress: "fourchette")
    static var previews: some View {
        ListFicheView(fichesVM : fichesVM, fiche: fiche)
    }
}

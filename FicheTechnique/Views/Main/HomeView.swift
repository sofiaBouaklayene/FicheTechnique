//
//  HomeView.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//
import SwiftUI
import Foundation

struct HomeView: View{
    //var image: String
    @ObservedObject var fichesVM : FichesVM
    @ObservedObject var etapesVM : EtapesVM
    @State private var search : String = ""
    
    
    var body: some View{
        
        NavigationView{
            List{
                ForEach(search == "" ? fichesVM.fiches : fichesVM.fiches.filter{$0.responsable.contains(search) || $0.categorie.contains(search) || $0.intitule.contains(search)}, id:\.id){
                    fiche in
                    
                    ListFicheView(fichesVM: fichesVM, fiche: fiche, etapesVM: etapesVM)
                    
                    
                    
                }.onDelete(perform : fichesVM.deleteFiche)
                  .onMove(perform : fichesVM.moveFiche)
                
                
                
            }
            .navigationTitle("Fiches techniques")
            .searchable(text: $search)
        
            
        }
        
    }
}

/*
struct HomeView_Previews: PreviewProvider {
    static var fichesVM : FichesVM = FichesVM()
    static var fiche : Fiche =  Fiche(intitule: "pates", responsable: "clement", nbrCouverts: 4, categorie: "plat", etapes: [Etape(titreEtape: "1 ere ", NomDenree: "truc", Ingredients: [ModelIngredFiche(nomingredient: "tomate", quantite: 2)], description: "truc", temps: 3)], materielSpes: "couteau", materielDress: "fourchette")
    static var previews: some View {
        HomeView(fichesVM : fichesVM)
    }
}
*/

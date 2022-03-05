//
//  NewRecipeView.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
import SwiftUI

struct NewRecipeView: View{
    @State private var showAddRecipe = false
    @ObservedObject var fichesVM : FichesVM
    @ObservedObject var ingrdVM : IngrsVM
    @ObservedObject var etapesVM : EtapesVM
   
    
    var body: some View{
        NavigationView{
            Button("Ajouter votre fiche technique"){
                showAddRecipe = true
            }.navigationTitle("Nouvelle fiche")
            
        }.navigationViewStyle(.stack)
            .sheet(isPresented: $showAddRecipe){
                AddRecipeView(fichesVM: fichesVM, ingrdVM: ingrdVM, etapeVM: etapesVM)
            }
    }
}
/*
struct NewRecipeView_Previews: PreviewProvider {
    static var fichesVM : FichesVM = FichesVM()
    static var previews: some View {
        NewRecipeView(fichesVM: fichesVM)
    }
}
*/

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
    var body: some View{
        NavigationView{
            Button("Ajouter votre fiche technique"){
                showAddRecipe = true
            }.navigationTitle("Nouvelle fiche")
            
        }.navigationViewStyle(.stack)
            .sheet(isPresented: $showAddRecipe){
                AddRecipeView()
            }
    }
}
struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}

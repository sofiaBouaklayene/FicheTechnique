//
//  TabBar.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
import SwiftUI

struct TabBar: View{
    @ObservedObject var ingrsVM : IngrsVM
    var body: some View{
        TabView{
            HomeView().tabItem{
                Label("Accueil", systemImage: "house")
                
            }
            NewRecipeView().tabItem{
                Label("Créer une fiche", systemImage: "plus")
            }
            CostCalculationView().tabItem{
                Label("Base de calcul", systemImage: "gear")
            }
            StockView(ingrsVM: ingrsVM).tabItem{
                Label("Stock", systemImage: "square.fill.text.grid.1x2")
            }
        }
    }
}
struct TabBar_Previews: PreviewProvider {
    static var ingrsVM : IngrsVM = IngrsVM()
    static var previews: some View {
        TabBar(ingrsVM : ingrsVM)
    }
}

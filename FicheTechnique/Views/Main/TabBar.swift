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
    @ObservedObject var fichesVM : FichesVM
    @ObservedObject var etapesVM : EtapesVM
    //@State var fiche : Fiche
   
    
    
    
    var body: some View{
        TabView{
            HomeView(fichesVM : fichesVM, etapesVM : etapesVM).tabItem{
                Label("Accueil", systemImage: "house")
            
            }
            NewRecipeView(fichesVM: fichesVM, ingrdVM: ingrsVM, etapesVM: etapesVM).tabItem{
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
/*
struct TabBar_Previews: PreviewProvider {
    static var ingrsVM : IngrsVM = IngrsVM()
    static var fichesVM : FichesVM = FichesVM()
    /*static var ingredient : Ingredient = Ingredient(idIngredient: 125, nom: "truc", categorie: "fruit", PU: 2, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustaces")*/
    
    static var previews: some View {
        TabBar(ingrsVM : ingrsVM, fichesVM : fichesVM)
    }
}
*/

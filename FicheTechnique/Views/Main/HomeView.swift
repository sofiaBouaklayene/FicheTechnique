//
//  HomeView.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//
import SwiftUI
import Foundation

struct HomeView: View{
    var body: some View{
        NavigationView{
            Text("Mes recettes").navigationTitle("Mes recettes")
        }
        .navigationViewStyle(.stack)
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

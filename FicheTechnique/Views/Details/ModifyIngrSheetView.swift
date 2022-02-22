//
//  ModifyIngrSheetView.swift
//  FicheTechnique
//
//  Created by m1 on 20/02/2022.
//

import Foundation
import SwiftUI
import Foundation

struct ModifyIngrSheetView: View{
    var body: some View{
        NavigationView{
            Text("Mes recettes").navigationTitle("Mes recettes")
        }
        .navigationViewStyle(.stack)
    }
}
struct ModifyIngrSheetView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  StepView.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
import SwiftUI

struct AddStepView: View{
    @State var titreEtape : String = ""
    @State var ensIngr : String = ""
    
    let formatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    let col = [GridItem](repeating: .init(.flexible()), count: 2)
    @State var errorMessage = "Error!"
    @State var showingAlert : Bool = false
    
    
    var body: some View{
        NavigationView{
            VStack{
                Text("Liste des étapes").font(.title)
                LazyVGrid(columns: col, alignment: .leading){
                    Text("Nom de létape").padding()
                    TextField("nom de l'étape", text : $titreEtape).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5)
                    Text("Nom de l'ensemble d'ingrédients").padding()
                    TextEditor(text: $ensIngr)
    
                    
                }
                LazyVGrid (columns: col, alignment: .leading){
                    Text("Ingredient").padding()
                    TextField("Nom de l'ingredient", text: $ensIngr)
                    Text("Quantité").padding()
                    TextField("Quantite", text: $ensIngr).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5)
                    
                }
            }
        }.navigationViewStyle(.stack)
    }
}
struct AddStepView_Previews: PreviewProvider {
    static var previews: some View {
        AddStepView()
    }
}

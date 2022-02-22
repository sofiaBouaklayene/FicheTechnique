//
//  AddRecipeView.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
import SwiftUI

struct AddRecipeView: View{
    @State private var intitule: String = ""
    @State private var selectedCategory: Categorie = Categorie.plat
    @State private var responsable: String = ""
    @State private var nbCouvert: String = ""
    @State private var materielSpe: String = ""
    @State private var materielDre: String = ""
    
    @Environment(\.dismiss) var dismiss
    @State private var showingAddStep = false
    
    var body: some View{
        NavigationView{
            Form{
                Section(header: Text("Intitulé:")){
                    TextField("Nom de la fiche", text: $intitule )
                }
                Section(header: Text("Categorie")){
                    Picker("Catégorie", selection: $selectedCategory){
                        ForEach(Categorie.allCases, id: \.self){
                            categorie in Text(categorie.rawValue).tag(categorie)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section(header: Text("Responsable:")){
                    TextField("Responsable de la fiche", text: $responsable )
                }
                Section(header: Text("Nombre de couvert:")){
                    TextField("nb de couvert", text: $nbCouvert)
                }
                Section(header: Text("Materiel spécifique:")){
                    TextEditor( text: $materielSpe )
                }
                Section(header: Text("Materiel de dréssage")){
                    TextEditor( text: $materielDre )
                }
                
                
            }.toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        dismiss()
                    }label:{
                        Label("Cancel", systemImage: "xmark")
                    }.labelStyle(.iconOnly)
                }
                
                ToolbarItem(){
                    Button(action :{
                        showingAddStep.toggle()
                    }, label:{
                        Label("Ajouter", systemImage: "checkmark")
                    }).sheet(isPresented: $showingAddStep){
                        AddStepView()
                    }
                    .disabled(intitule.isEmpty)
                    
                }
                
            })
            .navigationTitle("Créer votre fiche")
                .navigationBarTitleDisplayMode(.inline)
            
        }.navigationViewStyle(.stack)
    }
}
struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}



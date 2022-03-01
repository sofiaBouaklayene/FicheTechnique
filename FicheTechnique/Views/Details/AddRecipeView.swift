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
    @State private var nbCouvert: Int = 0
    @State private var materielSpe: String = ""
    @State private var materielDre: String = ""
    
    @State private var etape: Etape = Etape(titreEtape: "", NomDenree: "", Ingredients: [ModelIngredFiche(nomingredient: "", quantite: 0)], description: "", temps: 0)
    
    @ObservedObject var fichesVM : FichesVM
    
    let formatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
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
                
                Section(header: Text("Nombre de couvert")){
                    TextField("nb de couvert", value: $nbCouvert, formatter: formatter )
                }
              
                
                Section(header: Text("Materiel spécifique:")){
                    TextEditor( text: $materielSpe )
                }
                Section(header: Text("Materiel de dréssage")){
                    TextEditor( text: $materielDre )
                }
                Section(header: Text("etape")){
                    TextEditor( text: $etape.titreEtape )
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
        
        Button(action :{
            saveFiche()
          
        }, label:{
            Text("Enregistrer la fiche").bold().frame(width: 300, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding()
        })
    }
}
struct AddRecipeView_Previews: PreviewProvider {
    static var fichesVM : FichesVM = FichesVM()
    static var previews: some View {
        AddRecipeView(fichesVM: fichesVM)
    }
}

extension AddRecipeView{
    private func saveFiche(){
        let fiche = Fiche(intitule: intitule, responsable: responsable, nbrCouverts: nbCouvert, categorie: selectedCategory.rawValue, etapes: [etape], materielSpes: materielSpe, materielDress: materielDre)
        fichesVM.addFiche(fiche: fiche)
    }
}

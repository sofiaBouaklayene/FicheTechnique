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
    @State private var responsable: String = ""
    @State private var nbCouvert: Int = 0
    @State private var materielSpe: String = ""
    @State private var materielDre: String = ""
    
    @State private var showingAddStep = false
    
    @State private var etape: Etape = Etape(titreEtape: "", NomDenree: "", Ingredients: "", description: "", temps: 0)
    
    
    @ObservedObject var fichesVM : FichesVM
    @ObservedObject var ingrdVM : IngrsVM
    @ObservedObject var etapeVM : EtapesVM
    //@ObservedObject var ficheVM: FicheViewModel
    
    @StateObject var ficheViewModel = FicheViewModel(fiche: Fiche(intitule: "", responsable: "", nbCouverts: 0, categorie: "", etapes: [], materielSpes: "", materielDress: ""))
    
    let formatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    @Environment(\.dismiss) var dismiss
   
    
    var body: some View{
        NavigationView{
            Form{
                Section(header: Text("Intitulé:")){
                    TextField("Nom de la fiche", text: $ficheViewModel.intitule )
                }
                Section(header: Text("Categorie")){
                    Picker("Catégorie", selection: $ficheViewModel.categorie){
                        ForEach(fichesVM.categories, id: \.self){
                            categorie in Text(categorie.type).tag(categorie.type)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section(header: Text("Responsable:")){
                    TextField("Responsable de la fiche", text: $ficheViewModel.responsable )
                }
                
                Section(header: Text("Nombre de couvert")){
                    TextField("nb de couvert", value: $ficheViewModel.nbCouverts, formatter: formatter )
                }
              
                
                Section(header: Text("Materiel spécifique:")){
                    TextEditor( text: $ficheViewModel.materielSpes )
                }
                Section(header: Text("Materiel de dréssage")){
                    TextEditor( text: $ficheViewModel.materielDress )
                }
                /*Section(header: Text("etape")){
                    TextEditor( text: $etape.titreEtape )
                }*/
                
                
                
                
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
                        CreateStep(ingrdVM: ingrdVM, etapeVM: etapeVM, ficheViewModel : ficheViewModel)
                    }
                    .disabled(ficheViewModel.intitule.isEmpty)
                    
                }
                
                
            })
            .navigationTitle("Créer votre fiche")
                .navigationBarTitleDisplayMode(.inline)
            
        }.navigationViewStyle(.stack)
        
        Button(action :{
            self.handleAjoutTapped()
          
        }, label:{
            Text("Enregistrer la fiche").bold().frame(width: 300, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding()
        })
    }
    func handleAjoutTapped(){
        self.ficheViewModel.handleAjoutTapped()
       
    }
}
/*
struct AddRecipeView_Previews: PreviewProvider {
    static var fichesVM : FichesVM = FichesVM()
    static var previews: some View {
        AddRecipeView(fichesVM: fichesVM)
    }
}
 */
/*
extension AddRecipeView{
    private func saveFiche(){
        let fiche = Fiche(intitule: intitule, responsable: responsable, nbCouverts: nbCouvert, categorie: selectedCategory.rawValue, etapes: [] , materielSpes: materielSpe, materielDress: materielDre)
        fichesVM.addFiche(fiche: fiche)
    }
}
*/

//
//  CreateStep.swift
//  FicheTechnique
//
//  Created by m1 on 03/03/2022.
//

//
//  StepView.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
import SwiftUI

struct CreateStep: View{
    @State var titreEtape : String = ""
    @State var ensIngr : String = ""
    @State var description : String = ""
    @State var search : String = ""
    //@ObservedObject var etapeVM : Eta
    
    let formatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    let col = [GridItem](repeating: .init(.flexible()), count: 2)
    @State var errorMessage = "Error!"
    @State var showingAlert : Bool = false
    @State var showingListeEtapes : Bool = false
    @ObservedObject var ingrdVM : IngrsVM
    @ObservedObject var etapeVM : EtapesVM
    @State var showingstepsIngr : Bool = false
    
    @StateObject var etapeViewModel = EtapeViewModel(etape: Etape(titreEtape: "", NomDenree: "", Ingredients: [""], quantite:[], description: "", temps: 0))
    @ObservedObject var ficheViewModel : FicheViewModel
    
    
    //test
    @ObservedObject var etape : Etape = Etape(titreEtape: "", NomDenree: "", Ingredients: [""],quantite:[], description: "", temps: 0)
    
    @State var listEtape = Etape(titreEtape: "", NomDenree: "", Ingredients: [""],quantite: [] ,description: "", temps: 0)
    
    
    
    
    
    var body: some View{
        Text("Créez vos étapes").bold()
        LazyVGrid(columns: col, alignment: .leading){
            Text("Nom de l'étape").padding()
            TextField("Nom de l'étape", text : $etapeViewModel.titreEtape).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5)
        }
       
        LazyVGrid (columns: col, alignment: .leading){
            Text("Desciption").padding()
            TextEditor(text: $etapeViewModel.description)
            Text("temps").padding()
            TextField("Temps en min", value: $etapeViewModel.temps, formatter: formatter).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5)
          
            LazyVGrid (columns: col, alignment: .center){
                Text("Ingredient").padding(10)
              
                }
            Button(action :{
        
                showingstepsIngr.toggle()
              
            }, label:{
                Text("Ajouter un ingredient").bold().frame(width: 180, height: 40, alignment: . center).background(Color.green.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding()
            }).sheet(isPresented : $showingstepsIngr){
                ingrStepView(ingrsVM: ingrdVM, etapeViewModel: etapeViewModel, ficheViewModel : ficheViewModel)
                    
            
                
               
                /*Picker("Ingredient", selection: $selectedIngredient){
                    ForEach(ingrdVM.ingredients, id: \.id){
                        ingred in Text(ingred.nom)
                    }.padding(5)
                    
                   
                }*/
                
                
                
            }
            
           
            
           
            
        }
        
        LazyVGrid (columns: col, alignment: .leading){
        
            Button(action :{
        
                showingListeEtapes.toggle()
              
            }, label:{
                Text("Ajouter l'étape").bold().frame(width: 200, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding()
            }).sheet(isPresented : $showingListeEtapes){
                ListSteps(etapeVM: etapeVM, ficheViewModel : ficheViewModel)
            }
            
            Button(action :{
        
                self.handleCreateEtape()
                //etapeVM.etapes.append(etape)
              
            }, label:{
                Text("Valider etape").bold().frame(width: 200, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding()
            })
            
            
            
            
            
           
            
        }
        
        

        
      
        
                
                
               
            }
    func handleCreateEtape(){
        self.etapeViewModel.handleAjoutTapped()
       
    }
        }
/*
struct CreateStep_Previews: PreviewProvider {
    static var previews: some View {
        CreateStep()
    }
}

*/

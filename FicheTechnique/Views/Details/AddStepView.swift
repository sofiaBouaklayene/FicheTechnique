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
    @State var showingCreateStep = false
    @State var showingExistingSteps = false
    //@ObservedObject var ingrdVM: IngredientViewModel
    @ObservedObject var ingrdVM : IngrsVM
    @ObservedObject var etapesVM : EtapesVM
    @ObservedObject var ficheViewModel : FicheViewModel
    
    
    
    var body: some View{
    
        Button(action :{
            //showingExistingSteps
            
    
    
          
        }, label:{
            Text("Utiliser une étape").bold().frame(width: 300, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding()
        })
        Button(action :{
    
            showingCreateStep.toggle()
          
        }, label:{
            Text("Créer une étape").bold().frame(width: 300, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding()
        }).sheet(isPresented : $showingCreateStep){
            CreateStep(ingrdVM: ingrdVM, etapeVM: etapesVM, ficheViewModel: ficheViewModel)
        }
    
        
        LazyVGrid(columns: col, alignment: .leading){
            Text("Nom de l'étape").padding()
            TextField("nom de l'étape", text : $titreEtape).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5)

            
        }
        LazyVGrid (columns: col, alignment: .leading){
            Text("Ingredient").padding()
            TextField("Nom de l'ingredient", text: $ensIngr)
            Text("Quantité").padding()
            TextField("Quantite", text: $ensIngr).textFieldStyle(RoundedBorderTextFieldStyle()).padding(5)
            
        }
      
        NavigationLink(destination: EtapeView()){
        HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Le titre de l'étape")
                        .font(.system(size: 30, weight: .bold, design: .default))
                      
                }.padding(.trailing, 20)
        }
              
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.white)
                .modifier(CardModifier())
                .padding(.all, 10)
   
    }
                
                
               
            }
        }
/*
struct AddStepView_Previews: PreviewProvider {
    static var previews: some View {
        AddStepView()
    }
}
*/

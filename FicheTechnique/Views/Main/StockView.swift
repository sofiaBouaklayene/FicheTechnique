//
//  StockView.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//
import Foundation
import SwiftUI
import FirebaseFirestore
import Firebase

struct StockView: View{
    @ObservedObject var ingrsVM = IngrsVM()
    @State var search : String = ""
    @State private var showingAddIngrSheet = false
    @State private var showingModIngrSheet = false // modifier
    //@StateObject var ingredient : Ingredient

   

    
    var body: some View{
       
            VStack{
                NavigationView{List{
                                ForEach(search == "" ? ingrsVM.ingredients : ingrsVM.ingredients.filter{$0.nom.contains(search) || $0.categorie.contains(search)}, id:\.id){
                                        ingredient in
                                        ListIngrView(ingredient : ingredient, ingrsVM : ingrsVM)
                                   
                                    }
                    
                                /*.onDelete(perform : {
                                    indexSet in
                                    let ingredID = indexSet.map{
                                        ingrsVM.ingredients[$0].id
                                    }
                                    self.ingrsVM.deleteIngred(with: ingredID[0])
                                    
                                })*/
                                .onDelete(perform : ingrsVM.deleteIngredient)
                                        .onMove(perform : ingrsVM.moveIngr)
                            
                                
                                    
                    
                }
                   
                                .navigationTitle("Gestion de stock")
                                .searchable(text: $search)
                                    
                                }.onAppear(){
                                    self.ingrsVM.getAllIngredients()
                                }
               
              
                    Button(action :{
                        showingAddIngrSheet.toggle()
                    }, label:{
                        Text("Ajouter").bold().frame(width: 150, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding(5)
                    })
                    .sheet(isPresented: $showingAddIngrSheet){
                        AddIngrSheetView(ingrsVM: ingrsVM)
                    }
                
                
            }
                
            }
   
    
}

struct StockView_Previews: PreviewProvider {
    static var ingrsVM : IngrsVM = IngrsVM()
    /*static var ingredient : Ingredient = Ingredient(idIngredient: 125, nom: "truc", categorie: "fruit", PU: 2, unite: "kg", qtteStock: 5, allergene: true, CatAllergene: "crustaces")*/
    
    static var previews: some View {
        StockView(ingrsVM: ingrsVM)
    }
}

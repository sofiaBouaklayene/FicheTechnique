//
//  StockView.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//
import Foundation
import SwiftUI

struct StockView: View{
    @ObservedObject var ingrsVM = IngrsVM()
    @State var search : String = ""
    @State private var showingAddIngrSheet = false
    @State private var showingModIngrSheet = false // modifier
    
    var body: some View{
            VStack{
                NavigationView{
                                List{
                                    ForEach(search == "" ? ingrsVM.ingredients : ingrsVM.ingredients.filter{$0.nom.contains(search) || $0.categorie.contains(search)}, id:\.idIngredient){
                                        ingredient in
                                        ListIngrView(ingredient : ingredient, ingrsVM : ingrsVM)
                                   
                                    }.onDelete(perform : ingrsVM.deleteIngr)
                                        .onMove(perform : ingrsVM.moveIngr)
                            
                                
                                    
                                }
                                    
                                .navigationTitle("Gestion de stock")
                                .searchable(text: $search)
                                    
                                }
               
                HStack{
                    Button(action :{
                        showingAddIngrSheet.toggle()
                    }, label:{
                        Text("Ajouter").bold().frame(width: 150, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding(5)
                    }).sheet(isPresented: $showingAddIngrSheet){
                        AddIngrSheetView()
                    }
                    
                }
               
                
            }
        
    }
}

struct StockView_Previews: PreviewProvider {
    static var ingrsVM : IngrsVM = IngrsVM()
    static var previews: some View {
        StockView(ingrsVM: ingrsVM)
    }
}

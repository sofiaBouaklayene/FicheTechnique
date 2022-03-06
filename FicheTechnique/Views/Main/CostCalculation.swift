//
//  CostCalculation.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
import SwiftUI

struct CostCalculationView: View{
    @Environment(\.dismiss) var dismiss
    @State private var coutPersonnel: Int = 0
    @State private var coutFluide: Int = 0
    @State private var coeffMultiplicateur: Int = 0
    @State private var coutAssaisonnement: Int = 0
    
    
    let formatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    let col = [GridItem](repeating: .init(.flexible()), count: 2)

    var body: some View{
        NavigationView{
            VStack{
            Text("Vos couts par défaut").bold().padding()
            LazyVGrid (columns: col, alignment: .leading){
                
                
                  
                Text("Cout personnel:").padding(5)
                        TextField("Nom de la fiche", value: $coutPersonnel, formatter : formatter )
                    
                Text("Cout Fluide:").padding(5)
                        TextField("Cout fluide", value: $coutFluide, formatter : formatter)
                        
                    
                Text("Coefficient multiplicateur:").padding(5)
                        TextField("Coefficient", value: $coeffMultiplicateur, formatter : formatter )
                    
                Text("Cout assaisonnement:").padding(5)
                        TextField("Cout assaisonnement:", value: $coutAssaisonnement, formatter : formatter)
                    
                }
                    /*VStack{
                        Text("Insérez vos couts")
                        Section(header: Text("Cout personnel:")){
                            TextField("Nom de la fiche", value: $coutPersonnel, formatter : formatter )
                        }
                        Section(header: Text("Cout Fluide:")){
                            TextField("Cout fluide", value: $coutFluide, formatter : formatter)
                            
                        }
                        Section(header: Text("Coefficient multiplicateur:")){
                            TextField("Coefficient", value: $coeffMultiplicateur, formatter : formatter )
                        }
                        Section(header: Text("Cout assaisonnement:")){
                            TextField("Cout assaisonnement:", value: $coutAssaisonnement, formatter : formatter)
                        
                    }
                }*/
            }.toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        dismiss()
                    }label:{
                        Label("Cancel", systemImage: "xmark")
                    }.labelStyle(.iconOnly)
                }
                
                
                
                
            })
            .navigationTitle("Calculer vos couts")
                .navigationBarTitleDisplayMode(.inline)
            
            
        }.navigationViewStyle(.stack)
    }
}
struct CostCalculationView_Previews: PreviewProvider {
    static var previews: some View {
        CostCalculationView()
    }
}

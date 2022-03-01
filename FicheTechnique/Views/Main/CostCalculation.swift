//
//  CostCalculation.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import Foundation
import SwiftUI

struct CostCalculationView: View{
    /*@Environment(\.dismiss) var dismiss
    @State private var coutPersonnel: Int = 0
    @State private var coutFluide: Int = 0
    @State private var coeffMultiplicateur: Int = 0
    @State private var coutAssaisonnement: Int = 0
    
    
    let formatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()*/

    var body: some View{
        NavigationView{
            /*Form{
                VStack{
                    Text("Vos couts par défaut")
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
                    VStack{
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
                }
            }.toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        dismiss()
                    }label:{
                        Label("Cancel", systemImage: "xmark")
                    }.labelStyle(.iconOnly)
                }
                
                
                
                
            })
            .navigationTitle("Créer votre fiche")
                .navigationBarTitleDisplayMode(.inline)
            }*/
            
        }.navigationViewStyle(.stack)
    }
}
struct CostCalculationView_Previews: PreviewProvider {
    static var previews: some View {
        CostCalculationView()
    }
}

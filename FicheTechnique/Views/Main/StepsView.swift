//
//  StepsView.swift
//  FicheTechnique
//
//  Created by m1 on 19/02/2022.
//

import SwiftUI
import Foundation

struct StepsView: View{
    var body: some View{
        NavigationView{
            VStack(){
                let salmon = Color(red: 1.0, green: 130.0/255.0, blue: 121.0/255.0)
                Button("Créer une étape", action:{}).padding(10).frame(width: 138).foregroundColor(salmon.opacity(1)).background(salmon.opacity(0.25)).overlay(RoundedRectangle(cornerRadius: 10).stroke(salmon, lineWidth: 1.0))
                Button("Ajouter une étape", action:{}).padding(10).frame(width: 138).foregroundColor(.blue).background(.blue.opacity(0.25)).overlay(RoundedRectangle(cornerRadius: 10).stroke(.blue, lineWidth : 1.0))
            }
        }
        .navigationViewStyle(.stack)
    }
}
struct StepsView_Previews: PreviewProvider {
    static var previews: some View {
        StepsView()
    }
}

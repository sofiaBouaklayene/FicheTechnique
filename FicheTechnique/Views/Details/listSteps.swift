//
//  listSteps.swift
//  FicheTechnique
//
//  Created by m1 on 03/03/2022.
//

import SwiftUI
import Foundation

struct ListSteps: View{
    @ObservedObject var etapeVM : EtapesVM = EtapesVM()
    @State var search = ""
    @State var titre : String = ""
    let col = [GridItem](repeating: .init(.flexible()), count: 2)
    @ObservedObject var ficheViewModel : FicheViewModel
  
    
    
    var body: some View{
        
             VStack{
                 NavigationView{List{
                     ForEach(search == "" ? etapeVM.etapes : etapeVM.etapes.filter{$0.titreEtape.contains(search)}, id:\.id){
                                    etape in
                         
                         LazyVGrid(columns: col, alignment: .leading){
                             Text(etape.titreEtape).padding()
                             Button(action :{
                                 ficheViewModel.etapes.append(etape.id.uuidString)
                               
                             }, label:{
                                 Text("Add").bold().frame(width: 100, height: 40, alignment: . center).background(Color.orange.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding()
                             })
                             
                            

                             
                         }
                                         
                                     
                                    
                                     }
                                 
                             
                                 
                                     
                     
                 }.navigationTitle("Liste des étapes")
                         .searchable(text: $search)
                                 
                                     
                        }.onAppear(){
                            self.etapeVM.getAllEtapes()
                            }
                    }
                                         
            }
    
                                         
    }
                                         

//
//  FicheUIView.swift
//  FicheTechnique
//
//  Created by m1 on 24/02/2022.
//


import SwiftUI
import Foundation
import Firebase
import FirebaseFirestore

struct FicheUIView: View{
    @ObservedObject var fichesVM : FichesVM
    @ObservedObject var fiche : Fiche
    //@ObservedObject var etape : Etape
    @ObservedObject var etapesVM : EtapesVM
    
    //var fiche : Fiche

    
    var body: some View{
        List{
            
            VStack(alignment: .leading, spacing: -60){
                Image("dev_project")
                            .resizable()
                            .scaledToFit()
                            .frame(alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .center)
                                    .background(Color(red: 32/255, green: 36/255, blue: 38/255))
                                    .modifier(CardModifier())
                                    .padding(.all, 10)

                    }

            VStack{
                Text(" \(fiche.intitule)").bold()
                    .padding(10).font(.system(.title, design : .serif))
        }
            HStack(alignment: .center, spacing: 12){
                HStack(alignment: .center, spacing: 2){
                    Image(systemName: "person.2")
                    Text("Couverts: \(fiche.nbCouverts)")
                    
                }
                HStack(alignment: .center, spacing: 2){
                    Image(systemName: "clock")
                    Text("Durée: \(fiche.nbCouverts)")
                    
                }
                HStack(alignment: .center, spacing: 2){
                    Image(systemName: "flame")
                    Text("Chef: \(fiche.responsable)")
                    
                }
                
            }.font(.footnote)
                .foregroundColor(Color.gray)
            
           
            
            VStack{
                Text("Technique de réalisation").italic() .padding(10).font(.system(.title, design : .serif))
                //Text(fiche.etapes[0])
                ForEach(etapesVM.getetapes(etapesIn: fiche.etapes), id:\.id){ etape in VStack{
                    Text("Etape").bold().padding()
                //getdocument() je recupere le document ici
                    Text(etape.titreEtape).bold()
                    Text(etape.description)
                    Text("Durée").bold().padding()
                    Text("La durée est de\(etape.temps) min")
                   
                   
                    Text("Ingrédients").bold().padding()
                    //Text(etape.Ingredients)
                    ForEach(etape.Ingredients, id: \.self){ ingred in VStack{
                        Text(ingred)
                
                    
                        
                    }
                    
                }
                    Text("Les quantités").bold().padding()
                    ForEach(etape.quantite, id: \.self){ quantite in VStack{
                        Text("la quantite est \(quantite)")
                    
                        
                        }
                    }
                    
                    
                   
                    
                    
                    
                    
                    
                    
                }
                    
            }
            }
            VStack{
                Text("Matériel de dréssage").bold()
                    .padding(10).font(.system(.title, design : .serif))
                Text(" \(fiche.materielSpes)")
                Text("Matériel specifique").bold()
                    .padding(10).font(.system(.title, design : .serif))
                Text(" \(fiche.materielDress)")
            
            }
            VStack{
                Button(action :{
            
                    
                    //etapeVM.etapes.append(etape)
                  
                }, label:{
                    Text("Faire une vente").bold().frame(width: 200, height: 40, alignment: . center).background(Color.green.opacity(0.35)).cornerRadius(8).foregroundColor(Color.white).padding()
                })
            }
        }
    }

    }
/*
struct FicheUIView_Previews: PreviewProvider {
    static var fiche : Fiche =  Fiche(intitule: "pates", responsable: "clement", nbrCouverts: 4, categorie: "plat", etapes: [Etape(titreEtape: "1 ere ", NomDenree: "truc", Ingredients: [ModelIngredFiche(nomingredient: "tomate", quantite: 2)], description: "truc", temps: 3)], materielSpes: "couteau", materielDress: "fourchette")
    static var fichesVM : FichesVM = FichesVM()
    static var previews: some View {
        FicheUIView(fichesVM : fichesVM, fiche: fiche)
    }
}
*/

//
//  FicheUIView.swift
//  FicheTechnique
//
//  Created by m1 on 24/02/2022.
//


import SwiftUI
import Foundation

struct FicheUIView: View{
    @ObservedObject var fichesVM : FichesVM
    @ObservedObject var fiche : Fiche
    //@ObservedObject var etape : Etape
    
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
                    Text("Couverts: \(fiche.nbrCouverts)")
                    
                }
                HStack(alignment: .center, spacing: 2){
                    Image(systemName: "clock")
                    Text("Durée: \(fiche.nbrCouverts)")
                    
                }
                HStack(alignment: .center, spacing: 2){
                    Image(systemName: "flame")
                    Text("Chef: \(fiche.responsable)")
                    
                }
                
            }.font(.footnote)
                .foregroundColor(Color.gray)
            VStack{
                Text("Technique de réalisation").italic() .padding(10).font(.system(.title, design : .serif))
                
                ForEach(fiche.etapes, id:\.id){ etape in VStack{
                    Text("Etape").bold().padding()
                    Text(etape.titreEtape)
                    Text(etape.description)
                    Text("Ingrédients").bold().padding()
                    ForEach(etape.Ingredients, id: \.id){ ingred in VStack{
                        Text(ingred.nomingredient)
                        //Text(ingred.quantite)
                        
                    }
                    
                }
                    
                }
                    
            }
            }
        }
    }

    }
struct FicheUIView_Previews: PreviewProvider {
    static var fiche : Fiche =  Fiche(intitule: "pates", responsable: "clement", nbrCouverts: 4, categorie: "plat", etapes: [Etape(titreEtape: "1 ere ", NomDenree: "truc", Ingredients: [ModelIngredFiche(nomingredient: "tomate", quantite: 2)], description: "truc", temps: 3)], materielSpes: "couteau", materielDress: "fourchette")
    static var fichesVM : FichesVM = FichesVM()
    static var previews: some View {
        FicheUIView(fichesVM : fichesVM, fiche: fiche)
    }
}


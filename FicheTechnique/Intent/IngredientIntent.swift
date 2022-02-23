//
//  IngredientIntent.swift
//  FicheTechnique
//
//  Created by m1 on 22/02/2022.
//

import SwiftUI
import Foundation
import Combine

enum IngredientState :  Equatable, CustomStringConvertible {
    case ready
    case changingName(String)
    case nameChanged(String)
    
    var description : String{
        switch self{
        case .ready: return "State: ready"
        case .changingName(let name): return "State changingName(\(name))"
        case .nameChanged(let name): return "State nameChanged(\(name))"
        
        }
    }
}

enum IngredientListState :  Equatable, CustomStringConvertible {
    case ready
    case listUpdated
    
    var description : String{
        switch self{
        case .ready: return "State: ready"
        case .listUpdated: return "State listUpdated"
            
            
        }
    }
}

struct Intent{
    private var state = PassthroughSubject<IngredientState, Never>()
    private var stateList = PassthroughSubject<IngredientListState, Never>()
    //private var listIntent = TracksListIntent()
    
    func addObserver(viewModel : IngredientViewModel){
        self.state.subscribe(viewModel)
        //self.stateList.subscribe(listViewModel)
    }
    
    func addObserver(listViewModel : IngrsVM){
        self.stateList.subscribe(listViewModel)
    }
    
    
    func intentToChange(name : String){
        self.state.send(.changingName(name))
        //self.state.send(.listUpdated)
        self.stateList.send(.listUpdated)
        //self.listIntent.intentToChange(name: name)
        
    }
}

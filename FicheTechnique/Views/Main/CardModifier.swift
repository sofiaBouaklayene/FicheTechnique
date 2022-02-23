//
//  CardModifier.swift
//  FicheTechnique
//
//  Created by m1 on 23/02/2022.
//

import Foundation
import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}

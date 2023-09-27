//
//  BackgroundModifier.swift
//  GuessTheFlag
//
//  Created by Isaque da Silva on 26/09/23.
//

import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.thinMaterial)
            .cornerRadius(20)
            .shadow(radius: 10)
    }
}

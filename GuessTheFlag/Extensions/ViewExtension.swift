//
//  BackgroundModifierViewExtension.swift
//  GuessTheFlag
//
//  Created by Isaque da Silva on 26/09/23.
//

import SwiftUI

extension View {
    func Background() -> some View {
        modifier(BackgroundModifier())
    }
}

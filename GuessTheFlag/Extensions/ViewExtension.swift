//
//  BackgroundModifierViewExtension.swift
//  GuessTheFlag
//
//  Created by Isaque da Silva on 26/09/23.
//

import SwiftUI

extension View {
    func background() -> some View {
        modifier(BackgroundModifier())
    }
}

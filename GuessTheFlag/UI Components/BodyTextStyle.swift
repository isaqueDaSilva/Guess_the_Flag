//
//  BodyTextStyle.swift
//  GuessTheFlag
//
//  Created by Isaque da Silva on 26/09/23.
//

import SwiftUI

struct BodyTextStyle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title2.bold())
    }
}

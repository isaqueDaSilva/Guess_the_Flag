//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Isaque da Silva on 19/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        Button("Show Alert of Battery") {
            showingAlert = true
        } .alert("Low Battery", isPresented: $showingAlert) {
            VStack{
                Button("Low-Power Mode") { }
                Button("Close") { }
            }
        } message: {
            Text("20% battery charge left.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

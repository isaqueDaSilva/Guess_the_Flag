//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Isaque da Silva on 19/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreNumber = 0
    @State private var round = 1
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: .red, location: 0.35),
                Gradient.Stop(color: .cyan, location: 0.65)
            ]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                Spacer()
                VStack(spacing: 20){
                    Text("What's the Flag of \(countries[correctAnswer])?")
                        .font(.title2.bold())
                    ForEach(0..<3) { number in
                        Button(action: {
                            
                        }, label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .cornerRadius(10)
                                .shadow(radius: 20)
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .cornerRadius(20)
                .shadow(radius: 20)
                Spacer()
                HStack {
                    Text("Round \(round)")
                        .font(.title2.bold())
                    Spacer()
                    Text("Score: \(scoreNumber)")
                        .font(.title2.bold())
                } .padding()
                Spacer()
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

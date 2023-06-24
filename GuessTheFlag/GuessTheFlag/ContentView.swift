//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Isaque da Silva on 19/06/23.
//

import SwiftUI

struct TextModifier: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title2.bold())
    }
}

struct FlagImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .renderingMode(.original)
            .cornerRadius(10)
            .shadow(radius: 20)
    }
}

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.thinMaterial)
            .cornerRadius(20)
            .shadow(radius: 20)
    }
}

extension View {
    func Background() -> some View {
        modifier(BackgroundModifier())
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var correctionMessage = ""
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
                    TextModifier(text: "What's the Flag of \(countries[correctAnswer])?")
                    ForEach(0..<3) { number in
                        Button(action: {
                            showingScore = true
                            flagTapped(number)
                        }, label: {
                            FlagImage(image: countries[number])
                        })
                    }
                }
                .Background()
                
                Spacer()
                HStack {
                    TextModifier(text: "Round \(round)")
                    Spacer()
                    TextModifier(text: "Score: \(scoreNumber)")
                } .padding()
                Spacer()
            }.padding()
        }.alert(scoreTitle, isPresented: $showingScore) {
            if round < 10 {
                Button("Continue", action: {
                    askTheQuestion()
                    round += 1
                })
            } else if round == 10 {
                Button("New Game", action: {
                    round = 1
                    scoreNumber = 0
                })
            }
        } message: {
            Text(correctionMessage)
        }
    }
    
    func flagTapped(_ number: Int) {
        if round < 10 {
            if number == correctAnswer {
                scoreNumber += 5
                scoreTitle = "Correct"
                correctionMessage = "Your Score is \(scoreNumber)"
            } else {
                scoreTitle = "Wrong"
                correctionMessage = "This Flag is from \(countries[number])"
            }
        } else if round == 10 {
            scoreTitle = "Final Score"
            correctionMessage = "Your Final Score is \(scoreNumber)"
        }
    }
    
    func askTheQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

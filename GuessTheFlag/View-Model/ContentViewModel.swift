//
//  ContentView-ViewModel.swift
//  GuessTheFlag
//
//  Created by Isaque da Silva on 26/09/23.
//

import Foundation

extension ContentView {
    class ContentViewModel: ObservableObject {
        @Published var showingScore = false
        @Published var scoreTitle = ""
        @Published var correctionMessage = ""
        @Published var scoreNumber = 0
        @Published var round = 1
        @Published var guessSelect = 0
        @Published var correctAnswer = Int.random(in: 0...2)
        @Published var degress: [Double] = [0, 0, 0]
        @Published var opacity: [Double] = [1, 1, 1]
        
        @Published var countries: [Flag] = [
            Flag(place: "Estonia", labelDescription: "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white"),
            Flag(place: "France", labelDescription: "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red"),
            Flag(place: "Germany", labelDescription: "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold"),
            Flag(place: "Ireland", labelDescription: "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange"),
            Flag(place: "Italy", labelDescription: "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red"),
            Flag(place: "Nigeria", labelDescription: "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green"),
            Flag(place: "Poland", labelDescription: "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red"),
            Flag(place: "Russia", labelDescription: "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red"),
            Flag(place: "Spain", labelDescription: "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red"),
            Flag(place: "UK", labelDescription: "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background"),
            Flag(place: "US", labelDescription: "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner")
        ].shuffled()
        
        func flagTapped(_ number: Int) {
            if round < 10 {
                for guess in 0...2 {
                    if guess != guessSelect {
                        opacity[guess] = 0.25
                        degress[guess] = -180
                    }
                }
                
                if number == correctAnswer {
                    scoreNumber += 5
                    scoreTitle = "Correct"
                    correctionMessage = "Your Score is \(scoreNumber)"
                } else {
                    scoreTitle = "Wrong"
                    correctionMessage = "This Flag is from \(countries[number].place)"
                }
            } else if round == 10 {
                if scoreTitle == "Correct" {
                    scoreNumber += 5
                }
                scoreTitle = "Final Score"
                correctionMessage = "Your Final Score is \(scoreNumber)"
            }
        }
        
        func askTheQuestion() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            degress = [0, 0, 0]
            opacity = [1, 1, 1]
        }
        
        func nextStep() {
            if round < 10 {
                askTheQuestion()
                round += 1
            } else if round == 10 {
                round = 1
                scoreNumber = 0
            }
        }
        
        func verifiedCurrentFlag(_ flagNumber: Int) {
            guessSelect = flagNumber
            degress[flagNumber] += 360
            showingScore = true
            flagTapped(flagNumber)
        }
        
        func answer() -> String {
            "What's the Flag of \(countries[correctAnswer].place)?"
        }
    }
}

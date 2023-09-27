//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Isaque da Silva on 19/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                Gradient.Stop(color: .white, location: 0.4),
                Gradient.Stop(color: .cyan, location: 0.6)
                ]),
                startPoint: .top,
                endPoint: .bottom).ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.blue)
                Spacer()
                VStack(spacing: 20){
                    BodyTextStyle(text: viewModel.answer())
                    ForEach(0..<3) { number in
                        Button(action: {
                            withAnimation(.interpolatingSpring(stiffness: 3, damping: 1)) {
                                viewModel.verifiedCurrentFlag(number)
                            }
                        }, label: {
                            Image(viewModel.countries[number].place)
                                .renderingMode(.original)
                                .cornerRadius(10)
                                .shadow(radius: 20)
                                .rotation3DEffect(.degrees(viewModel.degress[number]), axis: (x: 0, y: 1, z: 0))
                                .opacity(viewModel.opacity[number])
                                .accessibilityLabel(viewModel.countries[number].labelDescription)
                        })
                    }
                }
                .background()
                
                Spacer()
                HStack {
                    BodyTextStyle(text: "Round \(viewModel.round)")
                    Spacer()
                    BodyTextStyle(text: "Score: \(viewModel.scoreNumber)")
                } .padding()
                Spacer()
            }.padding()
        }.alert(viewModel.scoreTitle, isPresented: $viewModel.showingScore) {
            Button(viewModel.round < 10 ? "Continue" : "New Game") {
                viewModel.nextStep()
            }
        } message: {
            Text(viewModel.correctionMessage)
        }
    }
}

//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Isaque da Silva on 19/06/23.
//

import SwiftUI

struct ContentView: View {
    var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: .blue, location: 0.35),
                Gradient.Stop(color: .cyan, location: 0.65)
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("What's the Flag of \(Countries.allCases[correctAnswer].rawValue)?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                ForEach(0..<3) { number in
                    Button {
                        
                    } label: {
                        Image(Countries.allCases[number].rawValue)
                            .renderingMode(.original)
                    }
                }
            }
        }
    }
}

enum Countries: String, CaseIterable {
    case Estonia, France, Germany, Ireland, Italy, Monaco, Nigeria, Poland, Russia, Spain, UK, US
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

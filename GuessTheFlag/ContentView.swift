//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Amr Hassan on 21.04.25.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland",  "Italy", "Spain", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [.init(color: .blue, location: 0.3), .init(color: .red, location: 0.3)], center: .top,
                           startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the flag")
                    .foregroundStyle(.white)
                    .font(.subheadline.weight(.heavy))

                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.headline.weight(.heavy))
                            .foregroundStyle(.white)
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.white)
                    }
                    
                    
                    
                    ForEach(0..<3) { index in
                        Button {
                            flagTapped(number: index)
                        } label: {
                            Image(countries[index])
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Spacer()
                
            }
            
        }.alert("", isPresented: $showScore) {
            Button("Continue") {
                showScore = false
            }
        } message: {
            Text(scoreTitle)
        }
    }
    
    func flagTapped(number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "False"
        }
        
        showScore = true
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}

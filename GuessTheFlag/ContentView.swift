//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Amr Hassan on 21.04.25.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland",  "Italy", "Spain", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                }
                .foregroundStyle(.white)
                
                ForEach(0..<3) { index in
                    Button {
                        //
                    } label: {
                        Image(countries[index])
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

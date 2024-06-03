//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Charlie Chiou on 2024/5/12.
//

import SwiftUI

struct BigBlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.blue)
    }
}


extension View {
    func bigblueTitleStyle() -> some View {
        self.modifier(BigBlueTitle())
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var round = 1
    
    @State private var chosenFlag: Int? = nil
    
//    @State private var isRoundEight = false

    
    var body: some View {
        let isRoundEight = Binding<Bool>(
            get: {
                round == 8
            },
            set: { _ in
                round = 0
            }
        )
        return ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                    .bigblueTitleStyle()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(country: countries[number])
                                .rotationEffect(.degrees(chosenFlag == number ? 360 : 0))
                                .offset(y: chosenFlag == number ? -10 : 0)
                                .opacity(chosenFlag != number && chosenFlag != nil ? 0.25 : 1)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Text("Round: \(round)")
                    .foregroundStyle(.white)
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("All done! Your total score is \(score).", isPresented: isRoundEight) {
            Button("New round", action: newRound)
        }
    }
    
    func flagTapped(_ number: Int) {
        withAnimation {
            chosenFlag = number
        } completion: {
            showingScore = true
        }
        
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong, that is \(countries[number])"
        }
        
        
    }
    
    func askQuestion() {
        round += 1
        
        chosenFlag = nil
        
//        if round == 9 {
//            isRoundEight = true
//            return
//        }
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func newRound() {
        round = 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}

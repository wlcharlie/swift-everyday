//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Charlie Chiou on 2024/5/14.
//

import SwiftUI

let moves = ["✊", "🖐️", "✌️"]

struct ContentView: View {
    @State private var appMove = -1
    @State private var playerMove = -1
    @State private var round = 1
    @State private var score = 0
    @State private var result = ""
    @State private var isEnd = false
    
    var body: some View {
        VStack() {
            Text("Computer Move")
            if appMove == -1 {
                Text("???")
            } else {
                Text("Computer: \(moves[appMove])")
            }
            Spacer()
            Text("Round \(round)")
            Text("\(result)")
            if result != "" {
                Button("Next round") {
                    nextRound()
                }
            }
            Spacer()
            if playerMove == -1 {
                HStack(spacing: 24) {
                    ForEach(0..<moves.count, id: \.self) { index in
                        Button{
                            playerChoose(index)
                        } label: {
                            Text("\(moves[index])")
                                .font(.system(size: 36))
                        }
                    }
                }
            } else {
                Text("You: \(moves[playerMove])")
            }
            Text("Your Move")
                .padding(.top, 4)
            Text("Your Score: \(score)")
                .padding(.top, 2)
        }
        .frame(height: 250)
        .alert("Done, your score \(score)", isPresented: $isEnd) {
            Button("New Game") {
                newGame()
            }
        }
    }
    
    func playerChoose(_ index: Int) {
        playerMove = index
        appMove = Int.random(in: 0..<moves.count)
        
        if (playerMove > appMove) || (playerMove == 0 && appMove == 2) {
            score += 1
            result = "You win"
        } else if (playerMove < appMove) || (playerMove == 2 && appMove == 0) {
            score -= 1
            result = "Computer win"
        } else {
            // tie
            result = "Tie"
        }
    }
    
    func nextRound() {
        if round == 10 {
            isEnd.toggle()
        }
        
        playerMove = -1
        appMove = -1
        round += 1
        result = ""
    }
    
    func newGame() {
        round = 0
        score = 0
        
        playerMove = -1
        appMove = -1
        round += 1
        result = ""
    }
}

#Preview {
    ContentView()
}

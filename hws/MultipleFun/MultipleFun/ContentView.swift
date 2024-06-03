//
//  ContentView.swift
//  MultipleFun
//
//  Created by Charlie Chiou on 2024/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var targetNumber: Int? = nil
    @State private var numberOfQuestions = 5
    @State private var questions: [(Int, Int)] = []
    @State private var currentQuestionIndex = 0
    @State private var isStart = false
    @State private var score = 0
    @State private var playerAnswer = ""
    
    var body: some View {
        VStack {
            if isStart {
                ZStack {
                    Color(red: 35 / 255, green: 39 / 255, blue: 47 / 255 )
                    VStack {
                        ZStack {
                            ForEach(0..<questions.count, id: \.self) { index in
                                if index == currentQuestionIndex {
                                    VStack {
                                        Text("Question \(currentQuestionIndex + 1)")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 20, weight: .semibold))
                                        
                                        Text("\(questions[currentQuestionIndex].0) x \(questions[currentQuestionIndex].1)")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 40, weight: .bold))
                                    }
                                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .opacity))
                                }
                            }
                        }
                    
                        TextField("Answer", text: $playerAnswer)
                            .textFieldStyle(.roundedBorder)
                            .font(.system(size: 48))
                            .multilineTextAlignment(TextAlignment.center)
                            .padding()
                        
                        Button("Submit") {
                            submitAnswer()
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Text("Current Score: \(score)")
                        

                        Button("RESET") {
                            reset()
                        }
                    }
                }
                .transition(.move(edge: .bottom))
            } else {
                VStack {
                    Spacer()
                    Group {
                        ForEach(2..<13) { num in
                            Button {
                                withAnimation(.spring) {
                                    targetNumber = num
                                }
                            } label: {
                                HStack {
                                    Text("\(num)")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 16, weight: .bold))
                                        .padding()
                                    Spacer()
                                }
                            }
                            
                            .background(Color(red: 0.25, green: 0.8, blue: 0.095 * Double(num) ))
                            .frame(width: .infinity, height: 40)
                            .cornerRadius(5)
                            .padding(3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(targetNumber == num ? Color(red: 35 / 255, green: 39 / 255, blue: 47 / 255 ) : Color.clear, lineWidth: 2)
                            )
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                    HStack {
                        Picker("Number of Questions", selection: $numberOfQuestions) {
                            Text("5 Questions").tag(5)
                            Text("10 Questions").tag(10)
                            Text("20 Questions").tag(20)
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding(.horizontal)
                    Button {
                        guard let targetNumber = targetNumber else { return }
                        withAnimation(.easeIn(duration: 1)) {
                            isStart = true
                        }
                        generateQuestions()
                    } label: {
                        Text("Start")
                            .font(.system(size: 48))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, maxHeight: 100)
                            .background(Color(red: 35 / 255, green: 39 / 255, blue: 47 / 255 ))
                    }

                    
                }
                .transition(.move(edge: .top))
            }
        }

        .ignoresSafeArea()

    }
    
    func generateQuestions () {
        guard let targetNumber = targetNumber else { return }
        for num in 0..<numberOfQuestions {
            let group = (targetNumber, Int.random(in: (num + 1)..<((num + 1) * 5)))
            questions.append(group)
        }
    }
    
    func submitAnswer() {
        let numericAnswer = Int(playerAnswer)
        guard let numericAnswer = numericAnswer else { return }
        
        let firstNumber = questions[currentQuestionIndex].0
        let secondNumber = questions[currentQuestionIndex].1
        let result = firstNumber * secondNumber
        
        if (result == numericAnswer) {
            score += 1
        }
        
        playerAnswer = ""
        
        if (currentQuestionIndex == questions.count - 1) {
            // done
            
            return
        }
        
        withAnimation {
            currentQuestionIndex += 1
        }
    }
    
    func reset() {
        questions = []
        currentQuestionIndex = 0
        isStart = false
        targetNumber = nil
        numberOfQuestions = 5
        score = 0
    }
}

#Preview {
    ContentView()
}

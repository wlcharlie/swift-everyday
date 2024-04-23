//
//  ContentView.swift
//  P1-Counter
//
//  Created by Charlie Chiou on 2024/4/22.
//

import SwiftUI

struct ContentView: View {
  @State var count = 0
  @GestureState var isDetectingLongPress = false
  
  func increment() {
    count += 1
  }
  
  func decrement() {
    count -= 1
  }
  
  func reset() {
    count = 0
  }
  
  func random() {
    count += Int.random(in: -5...5)
  }
  
  var body: some View {
    NavigationStack {
      VStack(alignment: .center, spacing: 20) {
        Text("\(count)")
          .font(.title)
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 40) {
          Button(action: decrement) {
            Text("-1")
              .font(.title)
          }
          Button(action: increment) {
            Text("+1")
              .font(.title)
          }
        }
        Button(action: random) {
          Text("Random")
            .font(.title)
        }
      }
      .padding()
      .navigationTitle("Counter")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button(action: reset) {
            Text("Reset")
          }
        }
      }
    }
  }
}


#Preview {
    ContentView()
}

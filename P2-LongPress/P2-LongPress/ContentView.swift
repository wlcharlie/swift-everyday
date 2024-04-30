//
//  ContentView.swift
//  P2-LongPress
//
//  Created by Charlie Chiou on 2024/4/30.
//

import SwiftUI

class Counter: ObservableObject {
  @Published var count = 0
  
  func increment () {
    count += 1
  }
}

class TimeCounter: ObservableObject {
  @Published var timer: Timer? = nil
  
  func start (callback: @escaping () -> Void ) {
    guard timer == nil else { return }
    
    timer = Timer.scheduledTimer(withTimeInterval: 0.125, repeats: true) { _ in
      callback()
    }
  }
  
  func stop() {
    if let optionalTimer = timer {
      optionalTimer.invalidate()
      timer = nil
    }
  }

  func toggle(perform: @escaping () -> Void) {
    if timer == nil {
      start {
        perform()
      }
    } else {
      stop()
    }
  }
}

struct ContentView: View {
  @State private var isDetectingLongPress = false
  @ObservedObject var counter = Counter()
  @ObservedObject private var timeCounter = TimeCounter()
  
    var body: some View {
        VStack {
          Spacer()
          if self.isDetectingLongPress {
            Text("Detecting long press, please hold.")
          } else {
            Text("Not detecting long press.")
          }
          Spacer()
          Text("\(counter.count)")
            .font(.system(size: 96))
          Spacer()
          Text("Hello, world!")
            .onLongPressGesture(minimumDuration: .infinity, perform: {}) { isPressing in
              isDetectingLongPress = isPressing
              print("Long Press in progress: \(isPressing)")
              timeCounter.toggle {
                counter.increment()
              }
            }
          Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

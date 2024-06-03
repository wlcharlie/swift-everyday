//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Charlie Chiou on 2024/5/14.
//

import SwiftUI

struct FlagImage: View {
    let country: String
    
    
    var body: some View {
        Text(country).foregroundStyle(.white)
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

#Preview {
    FlagImage(country: "Japan")
}

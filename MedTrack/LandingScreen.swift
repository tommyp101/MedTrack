//
//  ContentView.swift
//  MedTrack
//
//  Created by Tommy Pham on 2/16/24.
//

import SwiftUI

struct LandingScreen: View {
    var body: some View {
        VStack {
            Spacer()
            Text("MedTrack")
                .padding()
            Spacer()
            Button(action: {
            }) {
                Text("Next")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(20)
        }
    }
}

struct LandingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LandingScreen()
    }
}

//
//  IntroView.swift
//  Multiplication-Edutainment
//
//  Created by Gorkem Turan on 29.12.2022.
//

import SwiftUI

struct IntroView: View {
    @Binding var isTapped: Bool
    @State private var hasTimeElapsed = false
    var body: some View {
        NavigationView {
            ZStack {
                Image("Intro")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
//                    Text("MathTutor App")
//                        .padding(4)
//                        .font(Font.largeTitle.weight(.bold))
//                        .background(.clear)
//                        .foregroundColor(.blue)
//                        .offset(x: 0, y: -290)
                    
                    Text(!hasTimeElapsed ? "" : "Tap anywhere to start")
                        .task(delayText)
                        .padding(4)
                        .font(Font.largeTitle.weight(.bold))
                        .background(.clear)
                        .foregroundColor(.black)
                        .offset(x: 0, y: 300)
                        .animation(.easeInOut.speed(0.7))
                }
                
            }
//            .navigationTitle("MathTutor")
            .onTapGesture() {
                isTapped = true
            }
        }
    }
    private func delayText() async {
            // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            hasTimeElapsed = true
        }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(isTapped: .constant(false))
    }
}

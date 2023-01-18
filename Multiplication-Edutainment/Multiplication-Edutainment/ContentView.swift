//
//  ContentView.swift
//  Multiplication-Edutainment
//
//  Created by Gorkem Turan on 28.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isIntroPassed = false
    @StateObject var questions = Questions()
    @StateObject var gameSettings = GameSettings()
    
    var body: some View {
        if !gameSettings.gameIsOn {
            if !isIntroPassed{
                IntroView(isTapped: $isIntroPassed)
            } else {
                MainView(questions: questions, gameSettings: gameSettings)
            }
        } else {
            GameView(questions: questions, gameSettings: gameSettings)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

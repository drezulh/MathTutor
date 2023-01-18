//
//  GameSettings.swift
//  MathTutorApp
//
//  Created by Gorkem Turan on 29.12.2022.
//

import Foundation

class GameSettings: ObservableObject {
    @Published var countOfQuestions = 5
    @Published var level = 1
    @Published var multiplicationLevel = 5
    @Published var gameIsOn = false
    
}

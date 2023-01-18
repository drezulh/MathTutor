//
//  MainView.swift
//  Multiplication-Edutainment
//
//  Created by Gorkem Turan on 29.12.2022.
//


import SwiftUI

struct MainView: View {
//    @Binding var gameIsRunning : Bool
    let allLevels = Range(1...5)
//    @State private var multiplicationTables = Range(1...10)
    let variantsOfQuestions = [5, 10, 20]
    
    @ObservedObject var questions : Questions
    @ObservedObject var gameSettings : GameSettings

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.orange, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Choose difficulty level")
                    .gameLabel()
                
                
                Picker("Choose difficulty level", selection: $gameSettings.level) {
                    ForEach(allLevels, id: \.self) {
                        Text("\($0)")
                    }
                }
                .gamePickers()
                .onChange(of: gameSettings.level, perform: leveler)

                
//                Text("Choose multiplication table to practice")
//                    .gameLabel()
                
                
//                Picker("Choose multiplication table to practice", selection: $gameSettings.multiplicationLevel) {
//                    ForEach(multiplicationTables, id: \.self) {
//                        Text("\($0)")
//                    }
//                }
//                .gamePickers()
                
                Text("Choose number of questions")
                    .gameLabel()
                
                
                Picker("How many question you want to be asked?", selection: $gameSettings.countOfQuestions) {
                    ForEach(variantsOfQuestions, id: \.self) {
                        Text("\($0)")
                    }
                }
                .gamePickers()
                
                Button(action: {
                    startGame()
                    
                }) {
                    Text("Start Game")
                        .StartButtonGreen()
                }
                Spacer()
            }
        }
    }
    
    func leveler(level: Int) {
        if level == 1 {
            gameSettings.multiplicationLevel = 5
//            multiplicationTables = Range(1...10)
        } else if level == 2 {
            gameSettings.multiplicationLevel = 10
//            multiplicationTables = Range(11...20)
        } else if level == 3 {
            gameSettings.multiplicationLevel = 20
//            multiplicationTables = Range(21...30)
        } else if level == 4 {
            gameSettings.multiplicationLevel = 30
//            multiplicationTables = Range(31...40)
        } else if level == 5 {
            gameSettings.multiplicationLevel = 40
//            multiplicationTables = Range(41...50)
        }
    }
    
    func createQuestionsArray () {

        for i in 0 ..< gameSettings.multiplicationLevel {
            for j in 0 ..< gameSettings.multiplicationLevel {
                let tempQuestion = "\(i+1) x \(j+1) ?"
                let tempAnswer = (i+1)*(j+1)

                
                questions.items.append(Question(text: tempQuestion, answer: tempAnswer, answersSet: [tempAnswer]))
                
            }
        }
        for i in 0 ..< questions.items.count {
            while questions.items[i].answersSet.count < 4 {
                let tempWrongAnswer = Int.random(in:1 ... gameSettings.multiplicationLevel) * Int.random(in:1 ... gameSettings.multiplicationLevel)
                questions.items[i].answersSet.insert(tempWrongAnswer)
            }
            questions.items[i].answersArray = Array(questions.items[i].answersSet)
            questions.items[i].answersArray.shuffle()
        }
        print(questions.items)
        questions.items.shuffle()
    }
    
    func startGame() {
        createQuestionsArray()
        gameSettings.gameIsOn = true        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(questions: Questions(), gameSettings: GameSettings())
    }
}

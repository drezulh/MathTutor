//
//  GameView.swift
//  MathTutorApp
//
//  Created by Gorkem Turan on 29.12.2022.
//

import SwiftUI

struct GameView: View {
    @State private var imagesName = ["parrot", "duck", "dog", "horse", "rabbit", "whale", "rhino", "elephant", "zebra", "chicken", "cow", "panda", "hippo", "gorilla", "owl", "penguin", "sloth", "frog", "narwhal", "buffalo", "monkey", "giraffe", "moose", "pig", "snake", "bear", "chick", "walrus", "goat", "crocodile"]
    
    @State private var round = 0
    @State private var score = 0
    
    @State private var alertTitle = ""
//    @State private var buttonAlertTitle = ""
    @State private var isShowAlert = false
    @State private var isCorrect = false
    @State private var chosenAnswer = -1
    
    @ObservedObject var questions: Questions
    @ObservedObject var gameSettings: GameSettings
    
    var body: some View {
        Group {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.orange, .white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                if round < gameSettings.countOfQuestions {
                    VStack {
                        Text ("\(questions.items[round].text) = ?")
                            .gameLabel()
                            .font(.largeTitle)
                        
                        ForEach(0 ..< 4, id:\.self) { number in
                            HStack {
                                Button {
                                    checkAnswer(number: number)
                                } label: {
                                    
                                    Image(imagesName[number])
                                        .renderingMode(.original)
                                        .scaleEffect(0.5)
                                        .frame(width: 80, height: 80)
                                        .padding()
                                    Text("\(questions.items[round].answersArray[number])")
                                        .foregroundColor(Color.black)
                                        .font(.title)
                                    
                                }
                                .frame(width: 300, height: 100, alignment: .center)
                                .background(questions.items[round].answersArray.firstIndex(of: questions.items[round].answer) == number && alertTitle != "" ? Color.green : !isCorrect && chosenAnswer == number ? Color.red : Color.gray)
                                
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                                .animation(.easeInOut.speed(0.7))
                            }
                            
                        }
                        HStack {
                            Text("Score: \(score)")
                                .gameLabel()
                            Button("End Game") {
                                gameSettings.gameIsOn = false
                            }
                            .EndButtonPurple()
                            Text("Round: \(round+1)")
                                .gameLabel()
                        }
                        
                    }
                } else {
                    VStack{
                        Section {
                            Text("Game is over")
                            Text ("Your score is \(score)/100")
                        }
                        Button("Main Menu") {
                            gameSettings.gameIsOn = false
                        }
                        .EndButtonPurple()
                    }
                    
                }
            }
        }
        .alert(isPresented: $isShowAlert) { () -> Alert in
            Alert(title: Text("\(alertTitle)"), message: Text(" You score is: \(score)"), dismissButton: .default(Text((round+1 < gameSettings.countOfQuestions ? "Next Question" : "End the Game"))){
                nextQuestion()
//                if self.isWinGame {
//                    self.newGame()
//                    self.isWinGame = false
//                    self.isCorrect = false
//                } else if self.isCorrect  {
//                    self.isCorrect = false
//                    self.newQuestion()
//                } else {
//                    self.isWrong = false
//                }
                })
        }
    }
        
        func checkAnswer(number: Int) {
            chosenAnswer = number
            if questions.items[round].answersArray[number] == questions.items[round].answer {
                if gameSettings.countOfQuestions == 5 {
                    score += 20
                } else if gameSettings.countOfQuestions == 10 {
                    score += 10
                } else if gameSettings.countOfQuestions == 20 {
                    score += 5
                }

                alertTitle = "Correct"
//                buttonAlertTitle = "Next Question"
                isShowAlert = true
                isCorrect = true
                
            } else {

                alertTitle = "Wrong. Correct answer is \(questions.items[round].answer)"
//                buttonAlertTitle = "Next Question"
                isShowAlert = true
            }
            
//            nextQuestion()
        }
        
        func nextQuestion() {
            round += 1
            isShowAlert = false
            alertTitle = ""
            isCorrect = false
            chosenAnswer = -1
//            buttonAlertTitle = ""
        }
        
    }
    
    
    struct GameView_Previews: PreviewProvider {
        static var previews: some View {
            GameView(questions: Questions(), gameSettings: GameSettings())
        }
    }

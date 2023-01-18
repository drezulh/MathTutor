//
//  Question.swift
//  Multiplication-Edutainment
//
//  Created by Gorkem Turan on 29.12.2022.
//

import Foundation

struct Question {
    var text: String
    var answer: Int
    var answersSet = Set<Int>()
    var answersArray = [Int]()
}

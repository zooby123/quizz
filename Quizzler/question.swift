//
//  question.swift
//  Quizzler
//
//  Created by Zohaib Shahid on 26/05/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}

//class myOtherClass {
//    let question = Question(text: "Are you stupid", correctAnswer: true)
//}

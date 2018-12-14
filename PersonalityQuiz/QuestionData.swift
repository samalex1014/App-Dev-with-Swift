//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Smith, Sam on 12/4/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String {
        switch self{
        case .dog:
            return "You are outgoing"
        case .cat:
            return "Mischevious"
        case .rabbit:
            return "You love softness"
        case .turtle:
            return "You're wise or something"
        }
    }
}

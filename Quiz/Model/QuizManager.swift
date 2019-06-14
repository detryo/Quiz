//
//  QuizManager.swift
//  Quiz
//
//  Created by Cristian Sedano Arenas on 14/06/2019.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import GameKit

class QuizManager {
    
    var questionsAsked = 0
    var questionsPerRound = 4
    var correctQuestions = 0
    var indexOfSelectedQuestion = 0
    var randomNumberGenerated = [Int]()
    
    var question = ["This was the only US President to serve more than two consecutive terms.",
                    "Which of the following countries has the most residents?",
                    "In what year was the United Nations founded?",
                    "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
                    "Which nation produces the most oil?",
                    "Which country has most recently won consecutive World Cups in Soccer?",
                    "Which of the following rivers is longest?",
                    "Which city is the oldest?",
                    "Which country was the first to allow women to vote in national elections?",
                    "Which of these countries won the most medals in the 2012 Summer Games?"]
    
    var options = [["George Washington", "Franklin D. Roosevelt", "Woodrow Wilson", "Andrew Jackson"],
                   ["Nigeria", "Russia", "Iran", "Vietnam"],
                   ["1918", "1919", "1945", "1954"],
                   ["Paris",    "Washington D.C.",    "New York City",    "Boston"],
                   ["Iran", "Iraq", "Brazil", "Canada"],
                   ["Italy", "Brazil", "Argetina", "Spain"],
                   ["Yangtze","Mississippi", "Congo", "Mekong"],
                   ["Mexico City", "Cape Town", "San Juan", "Sydney"],
                   ["Poland", "United States",    "Sweden",    "Senegal"],
                   ["France", "Germany", "Japan", "Great Britian"],
                   ["The Long Night", "The Bells"]]
    
    var answsers = [2, 1, 3, 3, 4, 2, 2, 1, 1, 4, 1]
    var trivial: [Question]
    
    init() {
        trivial = [
            Question(question: question[0], options: options[0], answer: answsers[0]),
            Question(question: question[1], options: options[1], answer: answsers[1]),
            Question(question: question[2], options: options[2], answer: answsers[2]),
            Question(question: question[3], options: options[3], answer: answsers[3]),
            Question(question: question[4], options: options[4], answer: answsers[4]),
            Question(question: question[5], options: options[5], answer: answsers[5]),
            Question(question: question[6], options: options[6], answer: answsers[6]),
            Question(question: question[7], options: options[7], answer: answsers[7]),
            Question(question: question[8], options: options[8], answer: answsers[8]),
            Question(question: question[9], options: options[9], answer: answsers[9])]
    }
    
    func genertaeNumber() -> Int {
        var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: trivial.count)
        
        while randomNumberGenerated.contains(randomNumber) {
            randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: trivial.count)
        }
        
        randomNumberGenerated.append(randomNumber)
        return randomNumber
    }
    
    func randomQuestion() -> Question {
        return trivial[genertaeNumber()]
    }
}

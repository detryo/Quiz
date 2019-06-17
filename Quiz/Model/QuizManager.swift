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
    
    let questions = ["This was the only US President to serve more than two consecutive terms.",
                     "Which of the following countries has the most residents?",
                     "In what year was the United Nations founded?",
                     "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
                     "Which nation produces the most oil?",
                     "Which country has most recently won consecutive World Cups in Soccer?",
                     "Which of the following rivers is longest?",
                     "Which city is the oldest?",
                     "Which country was the first to allow women to vote in national elections?",
                     "Which of these countries won the most medals in the 2012 Summer Games?",
                     "Which Game of Thrones episode was the best?"]
    
    let options = [["George Washington", "Franklin D. Roosevelt", "Woodrow Wilson", "Andrew Jackson"],
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
    
    let answsers = [2, 1, 3, 3, 4, 2, 2, 1, 1, 4, 1]
    
    var quiz: [Question]
    
    init() {
        quiz = [Question(question: questions[0], option: options[0], answer: answsers[0]),
                  Question(question: questions[1], option: options[1], answer: answsers[1]),
                  Question(question: questions[2], option: options[2], answer: answsers[2]),
                  Question(question: questions[3], option: options[3], answer: answsers[3]),
                  Question(question: questions[4], option: options[4], answer: answsers[4]),
                  Question(question: questions[5], option: options[5], answer: answsers[5]),
                  Question(question: questions[6], option: options[6], answer: answsers[6]),
                  Question(question: questions[7], option: options[7], answer: answsers[7]),
                  Question(question: questions[8], option: options[8], answer: answsers[8]),
                  Question(question: questions[9], option: options[9], answer: answsers[9]),
                  Question(question: questions[10], option: options[10], answer: answsers[10])]
    }
    
    func generateUnquieNumber()-> Int {
        
        var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: quiz.count)
        
        while randomNumberGenerated.contains(randomNumber) {
            randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: quiz.count)
        }
        
        randomNumberGenerated.append(randomNumber)
         return randomNumber
    }
    
    // MARK: Random questionselection
    func randomQuestion() -> Question {
        
        return quiz[generateUnquieNumber()]
    }
}

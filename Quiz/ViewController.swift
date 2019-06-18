//
//  ViewController.swift
//  Quiz
//
//  Created by Cristian Sedano Arenas on 14/06/2019.
//  Copyright © 2019 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    var gameSound: SystemSoundID = 0
    var quiz = QuizManager()
    var question: Question!

    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelCorrectAndIncorrect: UILabel!
    @IBOutlet weak var buttonOptionOne: UIButton!
    @IBOutlet weak var buttonOptionTwo: UIButton!
    @IBOutlet weak var buttonOptionTree: UIButton!
    @IBOutlet weak var buttonOptionFour: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var startAgain: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGameStartSound()
        playGameStartSound()
        displayQuestion()
    }
    
    // Sound implementation
    func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func displayQuestion() {
       question = quiz.randomQuestion()
        labelQuestion.text = question.question
        labelCorrectAndIncorrect.text = ""
        
        if question.option.count == 2 {
            buttonOptionOne.isHidden = false
            buttonOptionTwo.isHidden = false
            buttonOptionTree.isHidden = true
            buttonOptionFour.isHidden = true
            buttonOptionOne.isEnabled = true
            buttonOptionTwo.isEnabled = true
            buttonOptionOne.setTitle(question.option[0], for: .normal)
            buttonOptionTwo.setTitle(question.option[1], for: .normal)
        }else {
            buttonOptionOne.isHidden = false
            buttonOptionTwo.isHidden = false
            buttonOptionTree.isHidden = false
            buttonOptionFour.isHidden = false
            buttonOptionOne.isEnabled = true
            buttonOptionTwo.isEnabled = true
            buttonOptionTree.isEnabled = true
            buttonOptionFour.isEnabled = true
            buttonOptionOne.setTitle(question.option[0], for: .normal)
            buttonOptionTwo.setTitle(question.option[1], for: .normal)
            buttonOptionTree.setTitle(question.option[2], for: .normal)
            buttonOptionFour.setTitle(question.option[3], for: .normal)
            
        }
        nextQuestion.isHidden = true
        startAgain.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        buttonOptionOne.isHidden = true
        buttonOptionTwo.isHidden = true
        buttonOptionTree.isHidden = true
        buttonOptionFour.isHidden = true
        
        // Display play again button and hide next question button
        startAgain.isHidden = false
        nextQuestion.isHidden = true
        labelCorrectAndIncorrect.text = ""
        
        labelQuestion.text = "Way to go!\nYou got \(quiz.correctQuestions) out of \(quiz.questionsPerRound) correct!"
    }
    
    func nextRound() {
        if quiz.questionsAsked == quiz.questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        quiz.questionsAsked += 1
        
        buttonOptionOne.isEnabled = false
        buttonOptionTwo.isEnabled = false
        buttonOptionTree.isEnabled = false
        buttonOptionFour.isEnabled = false
        nextQuestion.isHidden = false
        
        sender.isEnabled = true;
        
        if question.answer == sender.tag {
            quiz.correctQuestions += 1
            labelCorrectAndIncorrect.text = "Correct!"
            labelCorrectAndIncorrect.textColor = UIColor(red: 90/255.0, green: 187/255.0, blue: 181/255.0, alpha: 1.0)
        } else {
            labelCorrectAndIncorrect.text = "Sorry, that's not it!"
            labelCorrectAndIncorrect.textColor = UIColor(red: 239/255.0, green: 130/255.0, blue: 100/255.0, alpha: 1.0)
        }
    }
    
    @IBAction func startAgain(_ sender: UIButton) {
        // Generate Random Questions
        quiz.randomNumberGenerated = []
        
        // Show the answer buttons
        quiz.questionsAsked = 0
        quiz.correctQuestions = 0
        nextRound()
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
         nextRound()
    }
    
}

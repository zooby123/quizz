//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNo : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }

// Assigns the buttons True or false
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        questionNo = questionNo + 1
        nextQuestion()
    }
    
// progress bar, label and score update
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNo + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNo + 1)
    }
    
// goes to the next question and restarts quiz
    func nextQuestion() {
        if questionNo <= 12 {
        questionLabel.text = allQuestions.list[questionNo].questionText
            updateUI()
        }
        else {
            let alert = UIAlertController(title: "End of Quiz", message: "You scored: \(score) / 13. Do you want to restart?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
        })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
    }
}

    // checks the answer if it's correct
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNo].answer
        if correctAnswer == pickedAnswer {
//            print("Correct!")
            ProgressHUD.showSuccess("Correct!")
            score += 1 // or this way score = score + 1
        }
        else {
//            print("Wrong!")
            ProgressHUD.showError("Wrong!")
        }
    }
// restarts the quiz
    func startOver() {
       questionNo = 0
        nextQuestion()
        score = 0
        }
    
    }


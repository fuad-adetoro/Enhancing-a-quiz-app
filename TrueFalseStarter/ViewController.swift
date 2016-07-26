//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    var getQuestions: Questions!
    var correctAnswers = 0
    var questionCount = -1
    var gameSound: SystemSoundID = 1
    
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var firstQuestion: UIButton!
    @IBOutlet weak var secondQuestion: UIButton!
    @IBOutlet weak var thirdQuestion: UIButton!
    @IBOutlet weak var fourthQuestion: UIButton!
    
    @IBOutlet weak var currentScore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        firstQuestion.hidden = true
        secondQuestion.hidden = true
        thirdQuestion.hidden = true
        fourthQuestion.hidden = true
        questionField.text = "Are you ready?"
        playAgainButton.hidden = false
        playAgainButton.setTitle("Start Game", forState: UIControlState.Normal)
        currentScore.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAgainBtn() {
        questionCount = 0
        correctAnswers = 0
        firstQuestion.hidden = false
        secondQuestion.hidden = false
        thirdQuestion.hidden = false
        fourthQuestion.hidden = false
        playAgainButton.hidden = true
        currentScore.hidden = false
        playGameStartSound()
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        disableButtoninteraction()
        if sender.titleLabel!.text == getQuestions.answer {
            correctAnswers += 1
            currentScore.text = "Correct answers: \(correctAnswers)"
            questionField.text = "That's Correct!"
            sender.setTitleColor(UIColor(red: 15/225, green: 180/225, blue: 105/225, alpha: 1.0), forState: UIControlState.Normal)
            playCorrectSounds()
        } else {
            playWrongSounds()
            sender.setTitleColor(UIColor(red: 226/225, green: 69/225, blue: 76/225, alpha: 1.0), forState: UIControlState.Normal)
            questionField.text = ":( Nice try."
        }
        loadNextQuestions(seconds: 2)
    }
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        questionCount = 0
        playGameStartSound()
        displayQuestion()
        playAgainButton.hidden = true
        currentScore.hidden = false
        correctAnswers = 0
        currentScore.text = "Correct answers: \(correctAnswers)"
    }
    
    func loadNextQuestions(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.displayQuestion()
            self.resetButtoncolors()
            self.enableButtoninteraction()
        }
    }
    
    func displayQuestion(){
        firstQuestion.hidden = false
        secondQuestion.hidden = false
        thirdQuestion.hidden = false
        fourthQuestion.hidden = false
        
        //get random questions
        if questionCount == questionsArray.count - 1 {
            questionCount = 0
            endGame()
        } else {
            print(questionCount)
            getQuestions = questionsArray[questionCount]
            // hide any buttons that dont apply to the current question.
            
            if getQuestions.options.optionOne == "" {
                firstQuestion.hidden = true
            }
            
            if getQuestions.options.optionTwo == "" {
                secondQuestion.hidden = true
            }
            
            if getQuestions.options.optionThree == "" {
                thirdQuestion.hidden = true
            }
           
            if getQuestions.options.optionFour == "" {
                fourthQuestion.hidden = true
            }
            //assign questions & answers to each button
            questionField.text = getQuestions.question
            firstQuestion.setTitle(getQuestions.options.optionOne, forState: UIControlState.Normal)
            secondQuestion.setTitle(getQuestions.options.optionTwo, forState: UIControlState.Normal)
            thirdQuestion.setTitle(getQuestions.options.optionThree, forState: UIControlState.Normal)
            fourthQuestion.setTitle(getQuestions.options.optionFour, forState: UIControlState.Normal)
            questionCount += 1
        }
    }
    
    
    
    func resetButtoncolors(){
        //reset button colors
        firstQuestion.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        secondQuestion.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        thirdQuestion.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        fourthQuestion.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }
    
    func endGame() {
        questionField.text = "You scored \(correctAnswers) of \(questionsArray.count - 1) would you like to try again?"
        firstQuestion.hidden = true
        secondQuestion.hidden = true
        thirdQuestion.hidden = true
        fourthQuestion.hidden = true
        playAgainButton.hidden = false
        currentScore.hidden = true
        correctAnswers = 0
    }
    
    func disableButtoninteraction() {
        //prevents a bug that allows the user to select more than one answer
        firstQuestion.userInteractionEnabled = false
        secondQuestion.userInteractionEnabled = false
        thirdQuestion.userInteractionEnabled = false
        fourthQuestion.userInteractionEnabled = false
    }
    
    func enableButtoninteraction() {
        firstQuestion.userInteractionEnabled = true
        secondQuestion.userInteractionEnabled = true
        thirdQuestion.userInteractionEnabled = true
        fourthQuestion.userInteractionEnabled = true
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func playWrongSounds() {
        if let soundURL = NSBundle.mainBundle().URLForResource("wrong", withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound);
        }
    }
    
    func playCorrectSounds() {
        if let soundURL = NSBundle.mainBundle().URLForResource("correct", withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound);
            
        }
        
    }
}


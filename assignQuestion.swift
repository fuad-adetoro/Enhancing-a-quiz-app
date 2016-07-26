//
//  assignQuestion.swift
//  TrueFalseStarter
//
//  Created by Just Fuad on 24/07/2016.
//  Copyright © 2016 Treehouse. All rights reserved.
//

struct Options {
    var optionOne: String?
    var optionTwo: String?
    var optionThree: String?
    var optionFour: String?
}

class Questions {
    var question: String
    var answer: String
    var options: Options
    
    init(question: String, answer: String, options: Options){
        self.question = question
        self.answer = answer
        self.options = options
    }
}

let firstQuestion = Questions(question: "Is Treehouse an online Tech School", answer: "Yes", options: Options(optionOne: "Yes", optionTwo: "No", optionThree: "", optionFour: ""))


let secondQuestion = Questions(question: "Which Year was Swift released", answer: "2014", options: Options(optionOne: "2016", optionTwo: "1984", optionThree: "1991", optionFour: "2014"))

let thirdQuestion = Questions(question: "What is XCODE?", answer: "IDE", options: Options(optionOne: "IDE", optionTwo: "FaceBook", optionThree: "BBE", optionFour: "Fam"))

let fourthQuestion = Questions(question: "Who developed FaceBook?", answer: "Mark Zuckerburg", options: Options(optionOne: "Ryan Carson", optionTwo: "Mark Zuckerberg", optionThree: "Fuad Adetoro", optionFour: "Jamie Fox"))

let fifthQuestion = Questions(question: "Who did Dr Dre sell Dre Beats to?", answer: "Apple", options: Options(optionOne: "Treehouse", optionTwo: "Microsoft", optionThree: "Apple", optionFour: "Interscope"))

let sixthQuestion = Questions(question: "When was Twitter Developed?", answer: "2006", options: Options(optionOne: "2009", optionTwo: "1995", optionThree: "2001", optionFour: "2006"))

let seventhQuestion = Questions(question: "When did britain vote to Leave the EU", answer: "2016", options: Options(optionOne: "2016", optionTwo: "2018", optionThree: "2004", optionFour: "2013"))

let eighthQuestion = Questions(question: "Who bought summly?", answer: "Yahoo", options: Options(optionOne: "Nick D'alosio", optionTwo: "EE", optionThree: "Apple", optionFour: "Yahoo"))

let ninthQuestion = Questions(question: "Where is New South Wales?", answer: "Australia", options: Options(optionOne: "Australia", optionTwo: "Wales", optionThree: "United States of America", optionFour: "Nigeria"))

let tenthQuestion = Questions(question: "Who is 50 Cent?", answer: "A rapper", options: Options(optionOne: "A politician", optionTwo: "A barber", optionThree: "A Rapper", optionFour: ""))


let questionsArray = [firstQuestion, secondQuestion, thirdQuestion, fourthQuestion, fifthQuestion, sixthQuestion, seventhQuestion, eighthQuestion, ninthQuestion, tenthQuestion]
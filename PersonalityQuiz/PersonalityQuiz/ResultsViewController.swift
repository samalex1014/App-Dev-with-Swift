//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Smith, Sam on 12/4/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]!
    
    var tally: [AnimalType: Int] = [:]

    @IBOutlet weak var resultAnswer: UILabel!
    @IBOutlet weak var resultExplanation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()

        // Do any additional setup after loading the view.
    }
    
    
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = responses.map {$0.type}
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        //let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) -> Bool in return pair1.value > pair2.value })
        //let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswer.text = "You are a \(mostCommonAnswer.rawValue)"
        resultExplanation.text = mostCommonAnswer.definition
    }
    
    func calculatePersonalityResultMyAttempt() {
        var maxEntry: AnimalType = .cat
        var maxCount: Int = 0
        for answer in responses {
            if tally[answer.type] == nil {
                tally[answer.type] = 1
            } else {
                let count = tally[answer.type]!
                tally.updateValue(count+1, forKey: answer.type)
            }
            
            if tally[answer.type]! > maxCount {
                maxCount = tally[answer.type]!
                maxEntry = answer.type
            }
        }
        
        switch maxEntry {
        case .cat:
            displayCat()
        case .dog:
            displayDog()
        case .rabbit:
            displayRabbit()
        case .turtle:
            displayTurtle()
        }
    }
    
    func displayCat() {
        resultAnswer.text = "You are a cat!"
        resultExplanation.text = "This means nothing"
    }
    
    func displayDog() {
        resultAnswer.text = "You are a dog!"
        resultExplanation.text = "This means nothing"
    }
    
    func displayTurtle() {
        resultAnswer.text = "You are a turtle!"
        resultExplanation.text = "This means nothing"
    }
    
    func displayRabbit() {
        resultAnswer.text = "You are a rabbit!"
        resultExplanation.text = "This means nothing"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  QuizViewController.swift
//  PersonalityQuiz
//
//  Created by Smith, Sam on 12/4/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //Setup outlets for different stack views
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangeStackView: UIStackView!
    
    //Setup buttons/switches/sliders
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleLabel1: UILabel!
    @IBOutlet weak var multipleSwitch1: UISwitch!
    @IBOutlet weak var multipleLabel2: UILabel!
    @IBOutlet weak var multipleSwitch2: UISwitch!
    @IBOutlet weak var multipleLabel3: UILabel!
    @IBOutlet weak var multipleSwitch3: UISwitch!
    @IBOutlet weak var multipleLabel4: UILabel!
    @IBOutlet weak var multipleSwitch4: UISwitch!
    
    @IBOutlet weak var submitAnswerButton: UIButton!
    @IBOutlet weak var submitRangeAnswerButton: UIButton!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var rangeSlider: UISlider!
    @IBOutlet weak var rangeLabel1: UILabel!
    @IBOutlet weak var rangeLabel2: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    //Declare question array and index
    var questions: [Question] = [
        Question(text: "What's your favorite food?", type: .single, answers: [
            Answer(text: "American", type: .dog),
            Answer(text: "Mexican", type: .rabbit),
            Answer(text: "Chinese", type: .cat),
            Answer(text: "Italian", type: .turtle)]),
        Question(text: "Preferred tarnsportation?", type: .single, answers: [
            Answer(text: "Walking", type: .dog),
            Answer(text: "Biking", type: .cat),
            Answer(text: "Bussing", type: .turtle),
            Answer(text: "Driving", type: .rabbit)]),
        Question(text: "How active are you?", type: .ranged, answers: [
            Answer(text: "Inactive", type: .turtle),
            Answer(text: "Somewhat", type: .cat),
            Answer(text: "Decently", type: .dog),
            Answer(text: "Very", type: .rabbit)]),
        Question(text: "Favorite books?", type: .multiple, answers: [
            Answer(text: "Harry Potter", type: .dog),
            Answer(text: "Twilight", type: .cat),
            Answer(text: "Eragon", type: .rabbit),
            Answer(text: "East of Eden", type: .turtle)])]
    var currQuestion = 0
    
    var playerAnswers: [Answer] = []
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        navigationItem.title = "Question #\(currQuestion+1)"
        
        let currentQuestion = questions[currQuestion]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(currQuestion) / Float(questions.count)
        
        progressView.setProgress(totalProgress, animated: true)
        
        questionLabel.text = currentQuestion.text
        
        switch currentQuestion.type {
        case .single:
            updateSingleView(using: currentAnswers)
        case .multiple:
            updateMultipleView(using: currentAnswers)
        case .ranged:
            updateRangeView(using: currentAnswers)
        }
        
    }
    
    func updateSingleView(using: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(using[0].text, for: .normal)
        singleButton2.setTitle(using[1].text, for: .normal)
        singleButton3.setTitle(using[2].text, for: .normal)
        singleButton4.setTitle(using[3].text, for: .normal)
    }
    
    func updateMultipleView(using: [Answer]) {
        multipleStackView.isHidden = false
        multipleSwitch1.isOn = false
        multipleSwitch2.isOn = false
        multipleSwitch3.isOn = false
        multipleSwitch4.isOn = false
        multipleLabel1.text = using[0].text
        multipleLabel2.text = using[1].text
        multipleLabel3.text = using[2].text
        multipleLabel4.text = using[3].text
    }
    
    func updateRangeView(using: [Answer]) {
        rangeStackView.isHidden = false
        rangeSlider.setValue(0.5, animated: false)
        rangeLabel1.text = using.first?.text
        rangeLabel2.text = using.last?.text
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        
        let currentAnswers = questions[currQuestion].answers
        
        switch sender {
        case singleButton1:
            playerAnswers.append(currentAnswers[0])
        case singleButton2:
            playerAnswers.append(currentAnswers[1])
        case singleButton3:
            playerAnswers.append(currentAnswers[2])
        case singleButton4:
            playerAnswers.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    func nextQuestion() {
        currQuestion += 1
        
        if currQuestion < questions.count {
            
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        
    }
    
    @IBAction func multipleAnswerButtonPressed(_ sender: Any) {
        let currentAnswers = questions[currQuestion].answers
        
        if multipleSwitch1.isOn {
            playerAnswers.append(currentAnswers[0])
        }
        
        if multipleSwitch2.isOn {
            playerAnswers.append(currentAnswers[1])
        }
        if multipleSwitch3.isOn {
            playerAnswers.append(currentAnswers[2])
        }
        if multipleSwitch4.isOn {
            playerAnswers.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed(_ sender: Any) {
        let currentAnswers = questions[currQuestion].answers
        let answer = Int(round(rangeSlider.value * Float(currentAnswers.count-1)))
        
        playerAnswers.append(currentAnswers[answer])
        
        nextQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            guard let resultsViewController = segue.destination as? ResultsViewController else { return }
            resultsViewController.responses = playerAnswers
        }
    }
}

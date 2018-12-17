//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Smith, Sam on 12/16/18.
//

import UIKit

class AthleteFormViewController: UIViewController {
    var athlete: Athlete?
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var leagueTextField: UITextField!
    @IBOutlet var teamTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        if let selecteddAthlete = athlete {
            nameTextField.text = selecteddAthlete.name
            ageTextField.text = selecteddAthlete.age
            leagueTextField.text = selecteddAthlete.league
            teamTextField.text = selecteddAthlete.team
        }
    }
    @IBAction func saveButton(_ sender: Any) {
        guard let name = nameTextField.text, let age = ageTextField.text, let league = leagueTextField.text, let team = teamTextField.text else {return}
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: "UnwindToAthleteTable", sender: self)
    }
}

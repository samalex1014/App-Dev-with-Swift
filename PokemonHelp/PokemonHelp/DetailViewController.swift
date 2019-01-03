//
//  DetailViewController.swift
//  PokemonHelp
//
//  Created by Smith, Sam on 12/28/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var pokemon: Pokemon?
    var weakTypes: [PokemonType] = []
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeOne: UILabel!
    @IBOutlet weak var typeTwo: UILabel!
    @IBOutlet weak var weaknessOne: UILabel!
    @IBOutlet weak var weaknessTwo: UILabel!
    @IBOutlet weak var weaknessThree: UILabel!
    @IBOutlet weak var notEffectiveOne: UILabel!
    @IBOutlet weak var notEffectiveTwo: UILabel!
    @IBOutlet weak var notEffectiveThree: UILabel!
    @IBOutlet weak var notEffectiveFour: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonLabel.text = pokemon?.name.rawValue
        
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        var weaknesses: [PokemonType] = []
        var strength: [PokemonType] = []
        if self.pokemon?.type.count == 1 {
            typeTwo.isHidden = true
            typeOne.text = self.pokemon?.type.first?.rawValue
        } else {
            typeOne.text = self.pokemon?.type.first?.rawValue
            typeTwo.text = self.pokemon?.type.last?.rawValue
        }
        
        if let firstType = self.pokemon?.type.first {
            PokemonType.allCases.forEach {
                if Pokemon.weakness(target: firstType, attacker: $0) >= 2.0{
                    weaknesses.append($0)
                } else if Pokemon.weakness(target: firstType, attacker: $0) < 1.0 {
                    strength.append($0)
                }
            }
        }
        
        if let secondType = self.pokemon?.type.last {
            if secondType != self.pokemon?.type.first {
                PokemonType.allCases.forEach {
                    if Pokemon.weakness(target: secondType, attacker: $0) >= 2.0 {
                        weaknesses.append($0)
                    } else if Pokemon.weakness(target: secondType, attacker: $0) < 1.0 {
                        strength.append($0)
                    }
                }
            }
        }
        
        if weaknesses.count >= 1 {
            weaknessOne.text = weaknesses[0].rawValue
            
            if weaknesses.count >= 2 {
                weaknessTwo.text = weaknesses[1].rawValue
                
                if weaknesses.count >= 3 {
                    weaknessThree.text = weaknesses[2].rawValue
                } else {
                    weaknessThree.isHidden = true
                }
            } else {
                weaknessTwo.isHidden = true
                weaknessThree.isHidden = true
            }
        }
        
        if strength.count >= 1 {
            notEffectiveOne.text = strength[0].rawValue
            
            if strength.count >= 2 {
                notEffectiveTwo.text = strength[1].rawValue
                
                if strength.count >= 3 {
                    notEffectiveThree.text = strength[2].rawValue
                    
                    if strength.count >= 4 {
                        notEffectiveFour.text = strength[3].rawValue
                    } else {
                        notEffectiveFour.isHidden = true
                    }
                } else {
                    notEffectiveThree.isHidden = true
                    notEffectiveFour.isHidden = true
                }
            } else {
                notEffectiveTwo.isHidden = true
                notEffectiveThree.isHidden = true
                notEffectiveFour.isHidden = true
            }
        } else {
            notEffectiveOne.isHidden = true
            notEffectiveTwo.isHidden = true
            notEffectiveThree.isHidden = true
            notEffectiveFour.isHidden = true
        }
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

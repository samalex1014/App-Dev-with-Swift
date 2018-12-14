//
//  ViewController.swift
//  Light
//
//  Created by Smith, Sam on 11/20/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true;
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn = !lightOn
        updateUI()
    }
    
    func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


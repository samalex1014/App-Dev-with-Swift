//
//  ViewController.swift
//  TwoButtons
//
//  Created by Smith, Sam on 11/27/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func setTextButtonTapped(_ sender: Any) {
        textLabel.text = textField.text
        textField.text = ""
    }
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        textLabel.text = ""
        textField.text = ""
    }
    

}


//
//  ViewController.swift
//  Login
//
//  Created by Smith, Sam on 12/4/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var forgotUsername: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier  == "loginSegue" {
            segue.destination.navigationItem.title = username.text
        } else {
            attempt: do {
                guard let buttonPressed = sender as? UIButton else {break attempt}
            
                if buttonPressed == self.forgotPassword {
                    segue.destination.navigationItem.title = "Forgot Password"
                } else {
                    segue.destination.navigationItem.title = "Forgot Username"
                }
            }
        }
    }
    
    @IBAction func forgotUsernameAction(_ sender: Any) {
        performSegue(withIdentifier: "genericSegue", sender: forgotUsername)
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        performSegue(withIdentifier: "genericSegue", sender: forgotPassword)
    }
    
}


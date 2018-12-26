//
//  EmailSubmissionViewController.swift
//  Contest
//
//  Created by Smith, Sam on 12/26/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import UIKit

class EmailSubmissionViewController: UIViewController {
    var emailIsEmpty: Bool = false

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        if emailTextField.text!.isEmpty {
            UIView.animate(withDuration: 0.05, animations: {
                self.emailTextField.transform = CGAffineTransform(translationX: -5.0, y: 0.0)
            }) { (_) in
                UIView.animate(withDuration: 0.05, animations: {
                    self.emailTextField.transform = CGAffineTransform(translationX: 10.0, y: 0.0)
                }) { (_) in
                    UIView.animate(withDuration: 0.05) {
                        self.emailTextField.transform = CGAffineTransform.identity
                    }
                }
            }
        } else {
            performSegue(withIdentifier: "EmailSubmissionSegue", sender: (Any).self)
        }
    }
    
    
}

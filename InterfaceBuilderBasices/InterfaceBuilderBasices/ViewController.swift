//
//  ViewController.swift
//  InterfaceBuilderBasices
//
//  Created by Smith, Sam on 11/20/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var changeTitle: UIButton!
    @IBAction func actuallyChangeTitle(_ sender: Any) {
        mainLabel.text = "Again, no"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


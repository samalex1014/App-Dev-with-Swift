//
//  ViewController.swift
//  AppEventCount
//
//  Created by Smith, Sam on 12/14/18.
//  Copyright © 2018 Smith, Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var didFinishLaunchingLabel: UILabel!
    @IBOutlet var didBecomeActiveLabel: UILabel!
    @IBOutlet var willResignActiveLabel: UILabel!
    @IBOutlet var didEnterBackground: UILabel!
    @IBOutlet var willTerminateLabel: UILabel!
    @IBOutlet var willEnterForegroundLabel: UILabel!
    
    var finishLaunchingCount = 0
    var becameActiveCount = 0
    var willResignCount = 0
    var enterBackgroundCount = 0
    var willTerminateCount = 0
    var enteredForegroundCount = 0
    
    func updateView() {
        didFinishLaunchingLabel.text = "The app has launched \(finishLaunchingCount) times"
        didBecomeActiveLabel.text = "The app has become active \(becameActiveCount) times"
        willResignActiveLabel.text = "The app has resigned active state \(willResignCount) times"
        didEnterBackground.text = "The app has entered the background \(enterBackgroundCount) times"
        willTerminateLabel.text = "The app has entered will-terminate state \(willTerminateCount) times"
        willEnterForegroundLabel.text = "The app has entered the foreground \(enteredForegroundCount) times"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


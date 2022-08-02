//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var secondsRemaining = 5
    var totalTime = 5
    var elapsedTime = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        progressView.progress = 0
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        titleLabel.text = "How do you like your egg?"
        secondsRemaining = eggTimes[(sender.titleLabel?.text)!]!
        elapsedTime = 0
        progressView.progress = 0
        totalTime = eggTimes[(sender.titleLabel?.text)!]!
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

    }
    
    
    @objc func updateTimer() {
        if elapsedTime < totalTime {
            secondsRemaining = secondsRemaining - 1
            let percentage = calculatePercentage(remainingTime: secondsRemaining, totalTime: totalTime)
            progressView.progress = percentage
        } else {
            timer.invalidate()
            titleLabel.text = "Your egg is ready!"
        }
    }
    
    func calculatePercentage(remainingTime: Int, totalTime: Int) -> Float {
        elapsedTime = totalTime - remainingTime
        return Float(elapsedTime * 1) / Float(totalTime)
    }
}

//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diceImageView1.image = #imageLiteral(resourceName: "DiceFour")
        diceImageView2.image = #imageLiteral(resourceName: "DiceThree")
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let images = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix"), ]
        let leftDiceNumber = generateRandomNumber()
        let rightDiceNumber = generateRandomNumber()
        
        diceImageView1.image = images[leftDiceNumber]
        diceImageView2.image = images[rightDiceNumber]
        
    }
    
    func generateRandomNumber() -> Int {
        return Int.random(in: 0..<6)
    }
}


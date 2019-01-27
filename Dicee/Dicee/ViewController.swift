//
//  ViewController.swift
//  Dicee
//
//  Created by dyx on 1/26/19.
//  Copyright © 2019 dyx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1 :Int = 0
    var randomDiceIndex2 :Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceSum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDiceImages()
        updateDiceSum()
        
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        updateDiceImages()
        updateDiceSum()
    }
    
    func updateDiceImages(){
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
    }
    
    func updateDiceSum(){
        diceSum.text = "\(randomDiceIndex1 + randomDiceIndex2 + 2)"
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
}


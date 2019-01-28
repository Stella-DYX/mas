//
//  ViewController.swift
//  Dicee
//
//  Created by 何谊 on 1/26/19.
//  Copyright © 2019 何谊. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    var soundeffect: AVAudioPlayer = AVAudioPlayer()
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    @IBOutlet weak var diceImageView1: UIImageView!
    
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let musicFile = Bundle.main.path(forResource: "bleep", ofType: ".wav")
        do {
            try soundeffect = AVAudioPlayer (contentsOf:URL (fileURLWithPath: musicFile!))
        }
        catch {
            print (error)
        }
        
        
        updateDiceImage()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateDiceImage()
        soundeffect.play()

    }
    
    func updateDiceImage(){
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        print (randomDiceIndex1)
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])


    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImage()
    }
    
}


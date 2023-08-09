//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer: Timer?
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer?.invalidate()
        TitleLabel.text = "How do you like your eggs?"
        progressBar.progress = 0.0
        
        secondsPassed = 0
        let hardness = sender.currentTitle
        
        totalTime = eggTimes[hardness!]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
      
       
        }
  
    
    @objc func onTimerFires() {
        if secondsPassed < totalTime{
            secondsPassed += 1
            let percentageProgress: Float = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
        //print(secondsRemaining)
        //TitleLabel.text = "\(secondsRemaining)"
        }
        else  {
            TitleLabel.text = "Done!"
            timer?.invalidate()
            timer = nil
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
    }
  
  
    }
    
  



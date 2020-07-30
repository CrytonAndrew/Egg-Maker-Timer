//
//  ViewController.swift
//  EggTimer
//
//  Created by Cryton Sibanda on 08/07/2020.
//  Copyright © 2020. All rights reserved.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 5, "Medium": 7*60, "Hard": 12*60]
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate() // Stops timer from ticking
        let hardness = sender.currentTitle
        
        totalTime = eggTimes[hardness!]!
        progressBar.progress = 0.0 //Useful for restarting the program
        secondsPassed = 0 //Clicking a new button
        label.text = hardness //Clicking a new button
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    @objc func updateCounter(){
        //example functionality
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        }
        else{
            timer.invalidate() //Stops timer from ticking
            label.text = "DONE!"
            playSound()
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound" ,withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
    }
}
  

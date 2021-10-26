//
//  ViewController.swift
//  EggTimer
//
//  Created by Sidhartha Das on 27/04/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var sound = AVAudioPlayer()
//    var softness = 5
//    var medium = 7
//    var hard = 12
    
    @IBOutlet weak var progresing: UIProgressView!
    var hard=["soft":3,"midium":4,"hard":7]
    var totalTime = 0
    var timePassed = 0
    var time=Timer()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func hardness(_ sender: UIButton) {
       
        
        
 let hardess=sender.currentTitle!
        totalTime=hard[hardess]!
     time.invalidate()
        progresing.progress=0.0
        timePassed=0
        showDo.text=hardess
        
       time = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
        if  self.timePassed < self.totalTime {
                   self.timePassed += 1
            
            self.progresing.progress=Float(self.timePassed)/Float(self.totalTime)
            
               } else {
                
                   Timer.invalidate()
                self.showDo.text="done...!"
                guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")else{return}
                self.sound = try! AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                self.sound.play()
                
               }
    }
    
     
    
}

    @IBOutlet weak var showDo: UILabel!
}

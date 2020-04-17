//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

    class ViewController: UIViewController {
        
        @IBOutlet weak var progressBar: UIProgressView!
        
        @IBOutlet weak var titleLabel: UILabel!
    
    let eggTime = ["Soft": 3, "Medium": 4, "Hard":7 ]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
   @IBAction func hardnessSelected(_ sender: UIButton) {
        
    timer.invalidate()//ira parar o timer seum tiver clicado e ja contando e clicar em outro
    
    let hardness = sender.currentTitle!//usando o !estou dizendo que tenho certeza que term um dado para ser devolvido
    
    totalTime = eggTime[hardness]!
    
    progressBar.progress = 0
    secondsPassed = 0
    titleLabel.text = hardness
    
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    
}
    
    @objc func fireTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        }else{
            timer.invalidate()
            titleLabel.text = "Pronto"
    }
}
}

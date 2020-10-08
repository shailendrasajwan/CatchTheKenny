//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by vinni singh on 7/10/20.
//  Copyright © 2020 vinni singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    var timer = Timer()
    var counter = 0
    var kennyArray = [UIImageView]()
    var hideTimer = Timer()
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var kenny1: UIImageView!
    
    @IBOutlet weak var kenny2: UIImageView!
    
    @IBOutlet weak var kenny3: UIImageView!
    
    @IBOutlet weak var kenny4: UIImageView!
    
    @IBOutlet weak var kenny5: UIImageView!
    
    @IBOutlet weak var kenny6: UIImageView!
    
    @IBOutlet weak var kenny7: UIImageView!
    
    @IBOutlet weak var kenny8: UIImageView!
    
    @IBOutlet weak var kenny9: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(score)"
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        
        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9)
      
        kennyArray = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny6, kenny7, kenny8, kenny9]
         //Timer
        counter = 10
        timeLabel.text = "Score: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
         hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func hideKenny(){
    
    for kenny in kennyArray{
    kenny.isHidden = true
    }
    let random = Int(arc4random_uniform(UInt32(kennyArray.count-1)))
    kennyArray[random].isHidden = false
    }

      @objc func countDown(){
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
         timer.invalidate()
            
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
         
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
            
        }
    
    }
}


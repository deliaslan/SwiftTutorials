//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Adem Deliaslan on 8.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Objects
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelHighScore: UILabel!
    
    //define Steves
    @IBOutlet weak var steve1: UIImageView!
    @IBOutlet weak var steve2: UIImageView!
    @IBOutlet weak var steve3: UIImageView!
    @IBOutlet weak var steve4: UIImageView!
    @IBOutlet weak var steve5: UIImageView!
    @IBOutlet weak var steve6: UIImageView!
    @IBOutlet weak var steve7: UIImageView!
    @IBOutlet weak var steve8: UIImageView!
    @IBOutlet weak var steve9: UIImageView!
    
   
    
    //Defining Variables
    var timer = Timer()
    var counter = 20
    var score = 0
    var steveArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
        //Gesture enable etme
        steve1.isUserInteractionEnabled = true
        steve2.isUserInteractionEnabled = true
        steve3.isUserInteractionEnabled = true
        steve4.isUserInteractionEnabled = true
        steve5.isUserInteractionEnabled = true
        steve6.isUserInteractionEnabled = true
        steve7.isUserInteractionEnabled = true
        steve8.isUserInteractionEnabled = true
        steve9.isUserInteractionEnabled = true
        
        //gesture tanımlama
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(countScore))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(countScore))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(countScore))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(countScore))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(countScore))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(countScore))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(countScore))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(countScore))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(countScore))
        
        //gesture ataması
        steve1.addGestureRecognizer(gestureRecognizer1)
        steve2.addGestureRecognizer(gestureRecognizer2)
        steve3.addGestureRecognizer(gestureRecognizer3)
        steve4.addGestureRecognizer(gestureRecognizer4)
        steve5.addGestureRecognizer(gestureRecognizer5)
        steve6.addGestureRecognizer(gestureRecognizer6)
        steve7.addGestureRecognizer(gestureRecognizer7)
        steve8.addGestureRecognizer(gestureRecognizer8)
        steve9.addGestureRecognizer(gestureRecognizer9)
        
        //Array Steve
        steveArray = [steve1,steve2,steve3,steve4,steve5,steve6,steve7,steve8,steve9]

        //Timer Codes
        counter = 20
        labelTimer.text = "Kalan Süre: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        
        //Hide Timer Code
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideSteve), userInfo: nil, repeats: true)
        
        
        //hide Steve function called
        hideSteve()
        
        //High Score Showed
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
      
        if storedHighScore == nil {
            highScore = 0
            labelHighScore.text = "En yüksek skor: \(highScore)"
        }
        
        if let newHighScore = storedHighScore as? Int {
            highScore = newHighScore
            labelHighScore.text = "En yüksek skor: \(highScore)"
        }
       
    }
    
   
  
    
    @objc func hideSteve() {
        for steve in steveArray {
            steve.isHidden = true
        }
        
        let randomNumber = Int(arc4random_uniform(UInt32(steveArray.count - 1)))
        
        steveArray[randomNumber].isHidden = false
    }
    
    
    @objc func countScore(){
      //  print("Tapped Steve") //test code
        score = score + 1
        //Score
        labelScore.text = "Skor: \(score)"
        
       
    
       
        
    }
    
    
    
    @objc func countTime(){
        labelTimer.text = "Kalan Süre: \(counter)"
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            //steve stop
            hideTimer.invalidate()
            
            
            for steve in steveArray {
                steve.isUserInteractionEnabled = false
            }
            
            
            labelTimer.text = "Game Over"
            makeAlert(title: "Oyun Bitti!", message: "Tekrar oynamak ister misiniz?")
        }
        
        
        //highScore
        if self.score > self.highScore {
            self.highScore = self.score
            labelHighScore.text = "En Yüksek Skor: \(self.highScore)"
            UserDefaults.standard.set(self.highScore, forKey: "highScore")
        }
    }
    
    
    //UIAlertController UIAlertAction function
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let btnCancel = UIAlertAction(title: "Hayır", style: UIAlertAction.Style.cancel, handler: nil)
        let btnOK = UIAlertAction(title: "Oyna", style: UIAlertAction.Style.default) { UIAlertAction in
            //replay function
            self.score = 0
            self.labelScore.text = "Skor: \(self.score)"
            self.counter = 20
            self.labelTimer.text = "Kalan Süre: \(self.counter)"
            
            // countDown timer
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countTime), userInfo: nil, repeats: true)
            
            //Hide Timer Code
            self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideSteve), userInfo: nil, repeats: true)
            
            
            for steve in self.steveArray {
                steve.isUserInteractionEnabled = true
            }
        }
        alert.addAction(btnOK)
        alert.addAction(btnCancel)
        self.present(alert, animated: true, completion: nil)
    }
    
}


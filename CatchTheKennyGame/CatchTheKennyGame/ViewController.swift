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
    var counter = 10
    var score = 0
    // var highScore = Int(labelTimer.text!)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
        //Gesture
        steve1.isUserInteractionEnabled = true
        steve2.isUserInteractionEnabled = true
        steve3.isUserInteractionEnabled = true
        steve4.isUserInteractionEnabled = true
        steve5.isUserInteractionEnabled = true
        steve6.isUserInteractionEnabled = true
        steve7.isUserInteractionEnabled = true
        steve8.isUserInteractionEnabled = true
        steve9.isUserInteractionEnabled = true
        
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(countScore))
        
        steve1.addGestureRecognizer(gestureRecognizer)
//        steve2.addGestureRecognizer(gestureRecognizer)
//        steve3.addGestureRecognizer(gestureRecognizer)
//        steve4.addGestureRecognizer(gestureRecognizer)
//        steve5.addGestureRecognizer(gestureRecognizer)
//        steve6.addGestureRecognizer(gestureRecognizer)
//        steve7.addGestureRecognizer(gestureRecognizer)
//        steve8.addGestureRecognizer(gestureRecognizer)
//        steve9.addGestureRecognizer(gestureRecognizer)
        
        
        
        
        
        
        //Timer Codes
      //  counter = 10
        labelTimer.text = "Kalan Süre: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        
        //En yüksek skor
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        
        if let highScore = storedHighScore as? String {
            labelHighScore.text = "En Yüksek Skor: \(highScore)"
        }
        
        
        
    }
    
   
    @objc func countScore(){
        print("Tapped Steve")
        score = score + 1
        //Score
        labelScore.text = "Skor: \(score)"
    }
    
    
    
    @objc func countTime(){
        labelTimer.text = "Kalan Süre: \(counter)"
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            labelTimer.text = "Game Over"
            makeAlert(title: "Oyun Bitti!", message: "Tekrar oynamak ister misiniz?")
        }
    }
    
    
    //UIAlertController UIAlertAction function
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let btnOK = UIAlertAction(title: "Oyna", style: UIAlertAction.Style.default, handler: nil )
        let btnCancel = UIAlertAction(title: "Hayır", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(btnOK)
        alert.addAction(btnCancel)
        self.present(alert, animated: true, completion: nil)
    }
    
}


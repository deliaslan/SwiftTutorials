//
//  ViewController.swift
//  BirthDayNoteTaker
//
//  Created by Adem Deliaslan on 6.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var inputName: UITextField!
    @IBOutlet weak var inputBirthDay: UITextField!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelBirthDay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthDay = UserDefaults.standard.object(forKey: "birthday")
        
       
        
        if let name = storedName as? String {
            labelName.text = "Name: " +  name
        }
        
        if let birthday = storedBirthDay as? String {
            labelBirthDay.text = "Birthday:" + birthday
        }
    }


    @IBAction func btnSave(_ sender: Any) {
        
        UserDefaults.standard.set(inputName.text!, forKey: "name")
        UserDefaults.standard.set(inputBirthDay.text!, forKey: "birthday")
        
        if let nameInput = inputName.text {
            labelName.text = "Name: " + String(nameInput) // Kullanım 1
        }
        if let birthDayInput = inputBirthDay.text {
            labelBirthDay.text = "Birthday: \(birthDayInput)" //Kullanım 2
        }
        
        
        
    }
    
    @IBAction func btnDelete(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthDay = UserDefaults.standard.object(forKey: "birthday")
       
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            labelName.text = "Name: "
        }
        
        if (storedBirthDay as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            labelBirthDay.text = "Birthday: "
        }
        
    }
}


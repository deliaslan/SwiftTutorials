//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Adem Deliaslan on 22.02.2022.
//

import UIKit
import Parse //eklendi

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let parseObject = PFObject(className: "Okul")
        parseObject["name"] = "Hoca Ahmet Yesevi Üniversitesi"
        parseObject["department"] = "Computer Engineering"
        parseObject["class"] = 4
        
        parseObject.saveInBackground { success, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                print("Success uploaded")
            }
            
        }
        
        
    }


}


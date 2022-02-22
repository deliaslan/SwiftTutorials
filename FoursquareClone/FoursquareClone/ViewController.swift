//
//  ViewController.swift
//  FoursquareClone
//
//  Created by Adem Deliaslan on 22.02.2022.
//

import UIKit
import Parse //eklendi

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // veritabanına veri kaydetme
        //        let parseObject = PFObject(className: "Okul")
        //        parseObject["name"] = "Hoca Ahmet Yesevi Üniversitesi"
        //        parseObject["department"] = "Computer Engineering"
        //        parseObject["class"] = 4
        //
        //        parseObject.saveInBackground { success, error in
        //            if error != nil {
        //                print(error?.localizedDescription)
        //            } else {
        //                print("Success uploaded")
        //            }
        //
        //        }
        
        //sorgu yapma
        //        let query = PFQuery(className: "Okul")
        //        query.whereKey("name", equalTo: "Sakarya Üniversitesi")
        //        query.findObjectsInBackground { objects, error in
        //            if error != nil {
        //                print(error?.localizedDescription)
        //            } else {
        //                print(objects)
        //            }
        //        }
        //
        
      
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        if userNameText.text != "" && passwordText.text != "" {
            PFUser.logInWithUsername(inBackground: userNameText.text!, password: passwordText.text!) { user, error in
                if error != nil {
                    self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Error", buttonTitle: "OK")
                } else {
                    //Segue
//                    print("Wellcome")         // test code
//                    print(user?.username)   // test code
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        } else {
            makeAlert(title: "Error!", message: "Username and Password required to login", buttonTitle: "OK")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if userNameText.text != "" && passwordText.text != "" {
            
            let user = PFUser()
            user.username = userNameText.text!
            user.password = passwordText.text!
            
            user.signUpInBackground { success, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "User can not be created!", buttonTitle: "OK")
                } else {
                    //Segue
                    print("User created")
                }
            }
            
        } else {
            makeAlert(title: "Fields Error!", message: "Username and Password required!", buttonTitle: "OK")
        }
    }
    
    func makeAlert(title: String, message: String, buttonTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}



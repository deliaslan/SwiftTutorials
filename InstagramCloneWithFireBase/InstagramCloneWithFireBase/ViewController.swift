//
//  ViewController.swift
//  InstagramCloneWithFireBase
//
//  Created by Adem Deliaslan on 17.02.2022.
//

import UIKit
import Firebase 

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Current User stays signin mode - Kullanıcı giriş yapmışsa giriş yapmış olarak kalsın
        
      
        
    }

    @IBAction func signInClicked(_ sender: Any) {
      //  performSegue(withIdentifier: "toFeedVC", sender: nil)  //test code
        if passwordText.text != "" && emailText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { authdata, error in
                if error != nil {
                    self.makeAlert(title: "Sign In Error!", message: error?.localizedDescription ?? "Error", btnTitle: "OK")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
            makeAlert(title: "Error!", message: "Username and Password required", btnTitle: "OK")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        
        if passwordText.text != "" && emailText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text! ) { authdata, error in
                if error != nil {
                    self.makeAlert(title: "Sign Up Error!", message: error?.localizedDescription ?? "Error", btnTitle: "OK")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
            
            makeAlert(title: "Error!", message: "Username and Password required", btnTitle: "OK")
            
        }
       
        
    }
    
    
    func makeAlert(title: String?, message: String?, btnTitle: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}


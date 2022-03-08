//
//  ViewController.swift
//  SnapChatClone
//
//  Created by Adem Deliaslan on 7.03.2022.
//

import UIKit
import Firebase //eklendi

class SignInVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInButton(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { auth, error in
                if error != nil {
                    self.makeAlert(title: "OK", message: error?.localizedDescription ?? "Login error!")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            self.makeAlert(title: "Error", message: "Email/Password ?")
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if userNameText.text != "" && passwordText.text != "" && emailText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { auth, error in
                if error != nil {
                    self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Error")
                } else {
                    let fireStore = Firestore.firestore()
                    let userDictionary = ["email" : self.emailText.text!, "username" : self.userNameText.text!] as [String: Any]
                    fireStore.collection("UserInfo").addDocument(data: userDictionary) {error in
                        if error != nil {
                            self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Sorun VAR!!!")
                        }
                    }
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            self.makeAlert(title: "Error", message: "Username/Password/Email ???")
        }
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}


//
//  ViewController.swift
//  InstaCloneWithParse
//
//  Created by Adem Deliaslan on 27.03.2022.
//

import UIKit

class SignInCV: UIViewController {

    @IBOutlet weak var emailTextLabel: UITextField!
    @IBOutlet weak var passwordTextLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        performSegue(withIdentifier: "toTabBar", sender: nil)
    }
    @IBAction func signUpClicked(_ sender: Any) {
    }
    
}


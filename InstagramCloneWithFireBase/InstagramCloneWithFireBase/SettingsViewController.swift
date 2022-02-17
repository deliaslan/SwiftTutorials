//
//  SettingsViewController.swift
//  InstagramCloneWithFireBase
//
//  Created by Adem Deliaslan on 17.02.2022.
//

import UIKit
import Firebase //eklendi

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
       // performSegue(withIdentifier: "toViewController", sender: nil) //test code
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
        } catch {
            print("Sign Out Error!")
        }
            
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

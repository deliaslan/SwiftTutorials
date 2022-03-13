//
//  SettingsVC.swift
//  SnapChatClone
//
//  Created by Adem Deliaslan on 8.03.2022.
//

import UIKit
import Firebase //eklendi
import MapKit

class SettingsVC: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let logOutButton = UIButton(frame: CGRect(x: 10, y: 10, width: self.view.frame.width * 0.3, height: self.view.frame.height * 0.08))
        
        logOutButton.center = self.view.center
        logOutButton.backgroundColor = .gray
        logOutButton.setTitle("Sign Out", for: .normal)
        logOutButton.addTarget(self, action: #selector(logOutClickedButton2), for: .touchUpInside)

        logOutButton.layer.cornerRadius = 10; // this value vary as per your desire
        logOutButton.clipsToBounds = true
        
        self.view.addSubview(logOutButton)

        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func logOutClickedButton2(){
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSignInVC", sender: nil)
        } catch {
            makeAlert(title: "Error", message: "SignOut Error!")
        }
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

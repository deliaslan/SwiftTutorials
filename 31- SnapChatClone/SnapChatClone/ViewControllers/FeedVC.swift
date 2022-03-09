//
//  FeedVC.swift
//  SnapChatClone
//
//  Created by Adem Deliaslan on 8.03.2022.
//

import UIKit
import Firebase //eklendi

class FeedVC: UIViewController {

    let fireStoreDatabase = Firestore.firestore()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        getUserInfo()
    }
    

    func getUserInfo() {
        fireStoreDatabase.collection("UserInfo").whereField("email", isEqualTo: Auth.auth().currentUser!.email!).getDocuments { snaphot, error in
            if error != nil {
                makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
            } else {
                if snaphot?.isEmpty == false && snaphot != nil {
                    for document in snaphot!.documents {
                        if let username = document.get("username") as? String {
                            UserSingleton.sharedUserInfo.email = (Auth.auth().currentUser?.email)!
                            UserSingleton.sharedUserInfo.username = username
                        }
                    }
                }
        }
        
    }
  
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
    
    
}

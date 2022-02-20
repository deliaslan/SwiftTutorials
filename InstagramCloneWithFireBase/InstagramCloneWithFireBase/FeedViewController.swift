//
//  FeedViewController.swift
//  InstagramCloneWithFireBase
//
//  Created by Adem Deliaslan on 17.02.2022.
//

import UIKit
import Firebase //eklendi
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var userImageArray = [String]()
    var userLikeArray = [Int]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromFireStore()
    }
    
    //vetibananından veri çekme işlemi (realtime)
    
    func getDataFromFireStore() {
        let fireStoreDataBase = Firestore.firestore()
        
        fireStoreDataBase.collection("Posts").addSnapshotListener(includeMetadataChanges: true) { snapshot, error in
            if error != nil {
                self.makeAlert(title: "Error Post Feeding!", message: error?.localizedDescription, btnTitle: "OK")
            } else {
                if snapshot?.isEmpty != true {
                    
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.userLikeArray.removeAll(keepingCapacity: false)
                    self.userCommentArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                       
                        
                        print(documentID) //test code
                        
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                            print(document.get("postedBy") as? String)
                            
                        }
                        
                        if let postComment = document.get("postComment") as? String {
                            self.userCommentArray.append(postComment)
                            print(document.get("postComment") as? String)
                        }
                        
                        if let likes = document.get("likes") as? Int {
                            self.userLikeArray.append(likes)
                            print(document.get("likes") as? Int)
                        }
                        
                        if let imageURL = document.get("imageURL") as? String {
                            self.userImageArray.append(imageURL)
                            print(document.get("imageURL") as? String)
                        }
                    }
                    
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedCell
        cell.userEmailLabel.text = userEmailArray[indexPath.row]
        cell.userCommentLabel.text = userCommentArray[indexPath.row]
        cell.userLikeCounterLabel.text = String(userLikeArray[indexPath.row])
        cell.userImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row]))
        return cell
    }
    
    
    
    func makeAlert(title: String?, message: String?, btnTitle: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
}


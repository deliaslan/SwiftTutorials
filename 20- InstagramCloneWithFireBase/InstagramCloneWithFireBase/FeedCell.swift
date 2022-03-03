//
//  FeedCell.swift
//  InstagramCloneWithFireBase
//
//  Created by Adem Deliaslan on 20.02.2022.
//

import UIKit
import Firebase

class FeedCell: UITableViewCell {

    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userCommentLabel: UILabel!
    @IBOutlet weak var userLikeCounterLabel: UILabel!
    @IBOutlet weak var userDocumentID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func userLikeButton(_ sender: Any) {
       // print("like button clicked") // test code
        
        let fireStoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(userLikeCounterLabel.text!) {
            let likeStore = [ "likes": likeCount + 1] as [String: Any]
            fireStoreDatabase.collection("Posts").document(userDocumentID.text!).setData(likeStore, merge: true)
        }
        
        fireStoreDatabase.collection("Posts").document(userDocumentID.text!)
    }
}

//
//  FeedCell.swift
//  InstagramCloneWithFireBase
//
//  Created by Adem Deliaslan on 20.02.2022.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userCommentLabel: UILabel!
    @IBOutlet weak var userLikeCounterLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func userLikeButton(_ sender: Any) {
    }
}

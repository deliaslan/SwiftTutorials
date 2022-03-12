//
//  SnapVC.swift
//  SnapChatClone
//
//  Created by Adem Deliaslan on 8.03.2022.
//

import UIKit

class SnapVC: UIViewController {

    @IBOutlet weak var timeLeftLabel: UILabel!
    
    var selectedSnap: Snap?
    var selectedTime: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let leftTime = selectedTime {
            timeLeftLabel.text = "Time Left: \(leftTime)"
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

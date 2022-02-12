//
//  DetailsVC.swift
//  SimpsonsBook
//
//  Created by Adem Deliaslan on 11.02.2022.
//

import UIKit

class DetailsVC: UIViewController {
    
    var selectedSimpsonCharacter : Simpson?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelJob: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelName.text = selectedSimpsonCharacter?.name
        labelJob.text = selectedSimpsonCharacter?.job
        imageView.image = selectedSimpsonCharacter?.image
        
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

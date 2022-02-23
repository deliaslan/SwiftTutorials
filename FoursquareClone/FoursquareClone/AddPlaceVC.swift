//
//  AddPlaceVC.swift
//  FoursquareClone
//
//  Created by Adem Deliaslan on 22.02.2022.
//

import UIKit

class AddPlaceVC: UIViewController {

    @IBOutlet weak var placeNameText: UITextField!
    @IBOutlet weak var placeTypeText: UITextField!
    @IBOutlet weak var placeDescriptionText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  

    @IBAction func nextButtonClicked(_ sender: Any) {
        //segue
        self.performSegue(withIdentifier: "toMapVC", sender: nil)
    }
}

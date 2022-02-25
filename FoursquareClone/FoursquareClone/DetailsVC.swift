//
//  DetailsVC.swift
//  FoursquareClone
//
//  Created by Adem Deliaslan on 23.02.2022.
//

import UIKit
import MapKit //eklendi
import Parse

class DetailsVC: UIViewController {
    @IBOutlet weak var detailsPlaceName: UILabel!
    @IBOutlet weak var detailsPlaceType: UILabel!
    @IBOutlet weak var detailsDescription: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsMapView: MKMapView!
    
    var chosenPlaceId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let query = PFQuery(className: "Places")
        query.whereKey("objectId", equalTo: chosenPlaceId)
        query.findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Details can not be receieved", buttonTitle: "OK")
            } else {
                print(objects) //test code
            }
        }
    }
    
    func makeAlert(title: String, message: String, buttonTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
   

}

//
//  DetailsVC.swift
//  FoursquareClone
//
//  Created by Adem Deliaslan on 23.02.2022.
//

import UIKit
import MapKit //eklendi

class DetailsVC: UIViewController {
    @IBOutlet weak var detailsPlaceName: UILabel!
    @IBOutlet weak var detailsPlaceType: UILabel!
    @IBOutlet weak var detailsDescription: UILabel!
    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsMapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}

//
//  MapVC.swift
//  FoursquareClone
//
//  Created by Adem Deliaslan on 22.02.2022.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(saveMap))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButtonClicked))
        
        
    }
    @objc func saveMap() {
        
    }
    
    @objc func backButtonClicked() {
        
        self.dismiss(animated: true, completion: nil) // eğer navigation controllerın ilk elemanı ve daha önceki view a geçmek istiyorsak bu şekilde geçebiliriz.
    }

   

}

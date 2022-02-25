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
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getDataFromParse()
        
    }
    
    //verileri çekme
    func getDataFromParse() {
        let query = PFQuery(className: "Places")
        query.whereKey("objectId", equalTo: chosenPlaceId)
        query.findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Details can not be receieved", buttonTitle: "OK")
            } else {
                //                print(objects) //test code
                if objects != nil {
                    if objects!.count > 0 {
                        let chosenPlaceObject = objects![0] //seçlen sadece 1 veri olduğundan for loopa gerek yok.
                        
                        if let placeName = chosenPlaceObject.object(forKey: "placeName") as? String {
                            self.detailsPlaceName.text = placeName
                        }
                        if let placeType = chosenPlaceObject.object(forKey: "placeType") as? String {
                            self.detailsPlaceType.text = placeType
                        }
                        if let placeDescription = chosenPlaceObject.object(forKey: "placeDescription") as? String {
                            self.detailsDescription.text = placeDescription
                        }
                        
                        //harita bilgisini getirme
                        if let placeLatitude = chosenPlaceObject.object(forKey: "latitude") as? String{
                            if let placeLatitudeDouble = Double(placeLatitude){
                                self.chosenLatitude = placeLatitudeDouble
                            }
                        }
                        if let placeLongitude = chosenPlaceObject.object(forKey: "longitude") as? String {
                            if let placeLongitude = Double(placeLongitude) {
                                self.chosenLongitude = placeLongitude
                            }
                        }
                        
                        if let imageData = chosenPlaceObject.object(forKey: "placeImage") as? PFFileObject {
                            imageData.getDataInBackground { data, error in
                                if error == nil {
                                    if data != nil {
                                        self.detailsImageView.image = UIImage(data: data!)
                                    }
                                } else {
                                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Image can not load.", buttonTitle: "OK")
                                }
                            }
                        }
                    }
                    //MAPS
                    let location = CLLocationCoordinate2D(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                    let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
                    let region = MKCoordinateRegion(center: location, span: span)
                    
                    self.detailsMapView.setRegion(region, animated: true)
                }
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

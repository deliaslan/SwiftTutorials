//
//  PlaceModel.swift
//  FoursquareClone
//
//  Created by Adem Deliaslan on 23.02.2022.
//

import Foundation
import UIKit

//singleton model
class PlaceModel {
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeDescription = ""
    var placeImage = UIImage()
    var chosenLatitude = ""
    var chosenLongitude = ""
    private init(){
        
    }
    
}

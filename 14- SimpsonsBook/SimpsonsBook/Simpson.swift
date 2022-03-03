//
//  Simpson.swift
//  SimpsonsBook
//
//  Created by Adem Deliaslan on 11.02.2022.
//

import Foundation
import UIKit

enum RoleStatus {
    case Mother
    case Father
    case Boy
    case Girl
    case Baby
    
}

class Simpson {
    var name: String
    var age: Int
    var job: String
    var roleStatus: RoleStatus
    var image = UIImage()
    
    
    init(name: String, age: Int, job: String, roleStatus: RoleStatus, image: UIImage) {
        self.name = name //self olanlar class başında tanımlanan değişkenler sağdaki ise initialize için tanımlanan
        self.age = age
        self.job = job
        self.roleStatus = roleStatus
        self.image = image
    }
    
    
    
    
}



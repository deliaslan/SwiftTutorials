//
//  Task.swift
//  Firebase101
//
//  Created by Adem Deliaslan on 29.05.2022.
//

import Foundation


struct Task: Identifiable, Codable{
 
    var id =  UUID().uuidString
    var sinifAdi: String
    var yazilimAriza: String?
    var donanimAriza: String?
    var digerAriza: String?
    var name: String
    var surname: String
}


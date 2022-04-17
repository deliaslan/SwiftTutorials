//
//  UserModel.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 17.04.2022.
//

import Foundation

struct UserModel: Identifiable {
    var id: Int
    var name: String
    var email: String
    var password: String
    var gender: String
    var bio: String
    var image: String
}

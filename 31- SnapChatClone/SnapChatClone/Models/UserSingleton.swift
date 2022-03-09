//
//  UserSingleton.swift
//  SnapChatClone
//
//  Created by Adem Deliaslan on 9.03.2022.
//

import Foundation


class UserSingleton {
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    private init() {
        
    }
}

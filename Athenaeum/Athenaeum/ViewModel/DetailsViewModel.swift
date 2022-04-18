//
//  DetailsViewModel.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 18.04.2022.
//

import Foundation

class DetailsViewModel: ObservableObject {
    let model: BookModel
    
    let description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    init(model: BookModel) { self.model = model }
    
    func favouriteMethod() {
        
    }
    
    func messageMethod() {
        
    }
    
    func adoptMethod() {
        
    }
}

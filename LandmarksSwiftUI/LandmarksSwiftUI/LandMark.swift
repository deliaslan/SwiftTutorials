//
//  LandMark.swift
//  LandmarksSwiftUI
//
//  Created by Adem Deliaslan on 27.03.2022.
//

import Foundation


struct LandMark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
}

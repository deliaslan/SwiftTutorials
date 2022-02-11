//
//  Musician.swift
//  MusicianClass
//
//  Created by Adem Deliaslan on 11.02.2022.
//

import Foundation

class Musician {
    var name: String
    var age: Int
    var instrument: String
    
    
    //Initializer - diğer dillerde Constructor yapısına karşılık gelir.
    init(nameInit:String, ageInit:Int, instrumentInit: String) {
        name = nameInit
        age = ageInit
        instrument = instrumentInit
    }
}

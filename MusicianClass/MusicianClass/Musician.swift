//
//  Musician.swift
//  MusicianClass
//
//  Created by Adem Deliaslan on 11.02.2022.
//

import Foundation


enum MusicianType {
    case LeadGuitar
    case Vacalist
    case Drummer
    case Bassist
    case Violenist
}

class Musician {
    var name: String
    var age: Int
    var instrument: String
    var type : MusicianType
    
    
    //Initializer - diğer dillerde Constructor yapısına karşılık gelir.
    init(nameInit:String, ageInit:Int, instrumentInit: String, typeInit: MusicianType) {
        name = nameInit
        age = ageInit
        instrument = instrumentInit
        type = typeInit
    }
}

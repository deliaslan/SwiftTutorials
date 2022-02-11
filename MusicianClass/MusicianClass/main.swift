//
//  main.swift
//  MusicianClass
//
//  Created by Adem Deliaslan on 11.02.2022.
//

import Foundation


let james = Musician(nameInit: "James", ageInit: 50, instrumentInit: "Guitar", typeInit: .LeadGuitar)
let adem = Musician(nameInit: "Adem", ageInit: 38, instrumentInit: "Flüt", typeInit: MusicianType.Drummer) // burdaki gibi de yazılabilmektedir.

print(james.instrument)
print(adem.type)

james.sing()  //james e sing metodunun yapması gerekeni yaptırıyoruz.

let kirk = SuperMusician(nameInit: "Kirk", ageInit: 55, instrumentInit: "Guitar", typeInit: .LeadGuitar)

kirk.sing()


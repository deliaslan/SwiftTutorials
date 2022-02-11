//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Adem Deliaslan on 11.02.2022.
//

import Foundation

class SuperMusician : Musician {
    
    override func sing() {
        super.sing() //kalıtım aldığı sınıftaki metodu da super key ile kullanıyor
        print("Exit Lights")//ve üstüne ekleme yapabiliyor.
    }
}

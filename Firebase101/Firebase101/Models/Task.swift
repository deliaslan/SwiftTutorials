//
//  Task.swift
//  Firebase101
//
//  Created by Adem Deliaslan on 29.05.2022.
//

import Foundation


enum SinifAdlari {
    case Sinif1A
    case Sinif1B
    case Sinif1C
    case Sinif1D
    case Sinif2A
    case Sinif2B
    case Sinif2C
    case Sinif2D
    case Sinif3A
    case Sinif3B
    case Sinif3C
    case Sinif3D
    case Sinif4A
    case Sinif4B
    case Sinif4C
    case Sinif4D
    case Sinif5A
    case Sinif5B
    case Sinif6A
    case Sinif6B
    case Sinif7A
    case Sinif7B
    case Sinif8A
    case Sinif8B
}

struct Task: Identifiable{
    var id: String
   // let sinifAdi: SinifAdlari
    var sinifAdi: String
    var yazilimAriza: String?
    var donanimAriza: String?
    var digerAriza: String?
    var name: String
    var surname: String
}

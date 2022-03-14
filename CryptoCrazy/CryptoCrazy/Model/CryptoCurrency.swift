//
//  CryptoCurrency.swift
//  CryptoCrazy
//
//  Created by Adem Deliaslan on 14.03.2022.
//

import Foundation

struct CryptoCurrency : Decodable { //Apiden gelen json gösterimi ile aynı isimleri struct içerisinde kullanarak otomatik olarak decode edebilecek (Get için yeterli)
    let currency : String?
    let price : String?
}

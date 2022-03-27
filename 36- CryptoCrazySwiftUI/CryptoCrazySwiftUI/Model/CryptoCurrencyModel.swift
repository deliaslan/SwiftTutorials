//
//  CryptoCurrencyModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Adem Deliaslan on 20.03.2022.
//

import Foundation

struct CryptoCurrencyModel : Decodable, Identifiable, Hashable {  //enum kullanırken Hashable da kullanılması öeriliyor(Sebebine sonra bak!)
    
    let id = UUID()
    let currency : String
    let price : String
    
    private enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
}

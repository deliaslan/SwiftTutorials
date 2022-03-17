//
//  WebService.swift
//  CryptoCrazy
//
//  Created by Adem Deliaslan on 14.03.2022.
//

import Foundation

class WebService {
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> () ) {  //@escaping
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                //completion(cryptoList) //kontrol etmeden yükleme
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
    }
}

//
//  Webservice.swift
//  CryptoCrazySwiftUI
//
//  Created by Adem Deliaslan on 20.03.2022.
//

import Foundation
class Webservice {
    func downloadCurrencies(url: URL, completion: @escaping (Result<[CryptoCurrencyModel]?,DownloaderError>) -> Void){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(DownloaderError.badURL))
            }
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let currencies = try? JSONDecoder().decode([CryptoCurrencyModel].self, from: data) else {
                return completion(.failure(.dataParseError))
            }

            completion(.success(currencies))
        }.resume()
        
    }
}

enum DownloaderError : Error {
    case badURL
    case noData
    case dataParseError
}

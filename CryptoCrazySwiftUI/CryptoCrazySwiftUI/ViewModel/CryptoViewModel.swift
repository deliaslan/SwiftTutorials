//
//  CryptoViewModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Adem Deliaslan on 20.03.2022.
//

import Foundation


class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()  //yayın yaptırıyoruz haber sal gibi
    
    let webService = Webservice()
    
    func downloadCryptoAsync(url: URL) async {
        do{
            let cryptos = try await webService.downloadCurrenciesAsyınc(url: url)
            DispatchQueue.main.async {
                self.cryptoList = cryptos.map(CryptoViewModel.init)
            }
        } catch {
            print(error)
        }
        
    }
  /*  func downloadCryptos(url: URL){
        webService.downloadCurrencies(url: url) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let cryptos):
                if let cryptos = cryptos {
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                }
            }
        }
    } */
}

struct CryptoViewModel {
    let crypto : CryptoCurrencyModel
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
}

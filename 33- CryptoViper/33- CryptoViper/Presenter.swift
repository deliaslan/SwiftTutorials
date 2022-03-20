//
//  Presenter.swift
//  33- CryptoViper
//
//  Created by Adem Deliaslan on 17.03.2022.
//

import Foundation

//Class, protocol
//talks to -> interactor, router, view

enum NetworkError: Error {
    case NetworkFailed
    case ParsingFailed
}


protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor?  {get set}
    var view: AnyView? {get set}
    
    func InteractorDidDownloadCrypto(result: Result<[Crypto], Error>)
}


class CryptoPresenter : AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    func InteractorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case .success(let cryptos):
            //view.update
            view?.update(with: cryptos)
            print("update")
        case .failure (_):
            //view.update.error
            view?.update(with: "try again later...")
            print("error")
        }
    }
    
  
    
    
}

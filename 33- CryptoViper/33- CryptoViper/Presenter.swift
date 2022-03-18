//
//  Presenter.swift
//  33- CryptoViper
//
//  Created by Adem Deliaslan on 17.03.2022.
//

import Foundation

//Class, protocol
//talks to -> interactor, router, view

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor?  {get set}
    var view: AnyView? {get set}
    
    func InteractorDidDownloadCrypto(result: Result<[Crypto], Error>)
}


class CryptoPresenter : AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func InteractorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        <#code#>
    }
    
  
    
    
}

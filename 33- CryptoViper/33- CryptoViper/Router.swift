//
//  Router.swift
//  33- CryptoViper
//
//  Created by Adem Deliaslan on 17.03.2022.
//

import Foundation

//class, protocol
//EntryPoint

protocol AnyRouter {
    static func startExecution() -> AnyRouter
}

class CryptoRouter : AnyRouter {
    static func startExecution() -> AnyRouter{
        let router = CryptoRouter()
        return router
    }
    
    
}

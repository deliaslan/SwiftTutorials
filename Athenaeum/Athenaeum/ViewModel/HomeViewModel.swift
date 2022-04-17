//
//  HomeViewModel.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 17.04.2022.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var booksList = [BookModel]()
    
    init () {
        fetchBooksList()
    }
    
    func fetchBooksList() { booksList = BookData.books }
}

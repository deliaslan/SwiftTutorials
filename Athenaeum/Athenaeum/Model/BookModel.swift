//
//  BookModel.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 17.04.2022.
//

import Foundation

struct BookModel: Identifiable{
    var id: String
    var name: String
    var author: String
    var illustrator: String
    var publisher: String
    var publishDate: String
    var numberOfPages: Int
    var coverImage: String
  //  var bookSaver: UserModel
}

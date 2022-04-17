//
//  BookData.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 17.04.2022.
//

import Foundation

struct BookData {
    static let owner1 = UserModel(id: 1, name: "Adem DELİASLAN", email: "deliaslan@gmail.com", password: "password", gender: "Male", bio: "On the way to become an iOS developer...", image: "user1")
    static let books = [
        BookModel(id: 1, name: "Levent Kapadokya'da", author: "Mustafa Orakçı", illustrator: "Derya Işık Özbay", publisher: "Timaş Çocuk", publishDate: "2019", numberOfPages: 96, coverImage: "levent_kapadokyada", bookSaver: owner1),
        BookModel(id: 2, name: "Levent Pamukkale'de", author: "Mustafa Orakçı", illustrator: "Derya Işık Özbay", publisher: "Timaş Çocuk", publishDate: "2019", numberOfPages: 96, coverImage: "levent_kapadokyada_arka_kapak", bookSaver: owner1)]
}

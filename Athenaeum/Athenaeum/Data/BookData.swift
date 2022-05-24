//
//  BookData.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 17.04.2022.
//

import Foundation
import SwiftUI
import Firebase


//class BookDataa: ObservableObject {
//    @Published var books: [BookModel] = []
//    
//    init() {
//        fetchBooks()
//    }
//    
//    func fetchBooks() {
//        books.removeAll()
//        let db = Firestore.firestore()
//        let ref = db.collection("Books")
//        ref.getDocuments { snapshot, error in
//            guard error == nil else {
//                print(error?.localizedDescription ?? "Bilinmeyen bir hata oluştu")
//                return
//            }
//            
//            if let snapshot = snapshot {
//                for document in snapshot.documents {
//                    let data = document.data()
//                    
//                    let id = data["id"] as? String ?? ""
//                    let name = data["name"] as? String ?? "Bilinmeyen Kitap"
//                    let author = data["author"] as? String ?? ""
//                    let illustrator = data["illustrator"] as? String ?? ""
//                    let publisher = data["publisher"] as? String ?? ""
//                    let publishDate = data["publishDate"] as? String ?? ""
//                    let numberOfPages = data["numberOfPages"] as? Int ?? 0
//                    let coverImage = data["coverImage"] as? String ?? ""
//                 //   let bookSaver = data["bookSaver"] as? UserModel()
//                    
//                    
//                    let book = BookModel(id: id, name: name, author: author, illustrator: illustrator, publisher: publisher, publishDate: publishDate, numberOfPages: numberOfPages, coverImage: coverImage)
//                    self.books.append(book)
//                    
//                }
//            }
//        }
//        
//    }
//}




struct BookData {
    static let owner1 = UserModel(id: 1, name: "Adem DELİASLAN", email: "deliaslan@gmail.com", password: "password", gender: "Male", bio: "On the way to become an iOS developer...", image: "user1")
    static let books = [
        BookModel(id: "1", name: "Levent Kapadokya'da", author: "Mustafa Orakçı", illustrator: "Derya Işık Özbay", publisher: "Timaş Çocuk", publishDate: "2019", numberOfPages: 96, coverImage: "levent_kapadokyada"),
        BookModel(id: "2", name: "Levent Pamukkale'de", author: "Mustafa Orakçı", illustrator: "Derya Işık Özbay", publisher: "Timaş Çocuk", publishDate: "2019", numberOfPages: 96, coverImage: "levent_kapadokyada_arka_kapak"),
        BookModel(id: "3", name: "Levent Kapadokya'da", author: "Mustafa Orakçı", illustrator: "Derya Işık Özbay", publisher: "Timaş Çocuk", publishDate: "2019", numberOfPages: 96, coverImage: "levent_kapadokyada"),
        BookModel(id: "4", name: "Levent Kapadokya'da", author: "Mustafa Orakçı", illustrator: "Derya Işık Özbay", publisher: "Timaş Çocuk", publishDate: "2019", numberOfPages: 96, coverImage: "levent_kapadokyada"),
        BookModel(id: "5", name: "Levent Kapadokya'da", author: "Mustafa Orakçı", illustrator: "Derya Işık Özbay", publisher: "Timaş Çocuk", publishDate: "2019", numberOfPages: 96, coverImage: "levent_kapadokyada"),
        BookModel(id: "6", name: "Levent Kapadokya'da", author: "Mustafa Orakçı", illustrator: "Derya Işık Özbay", publisher: "Timaş Çocuk", publishDate: "2019", numberOfPages: 96, coverImage: "levent_kapadokyada"),
        BookModel(id: "7", name: "Levent Kapadokya'da", author: "Mustafa Orakçı", illustrator: "Derya Işık Özbay", publisher: "Timaş Çocuk", publishDate: "2019", numberOfPages: 96, coverImage: "levent_kapadokyada")]
}




//
//  HomeViewModel.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 17.04.2022.
//

import Foundation
import Firebase

class RowViewModel: ObservableObject {
    
    @Published var booksList = [BookModel]()
    
    init () {
        fetchBooksList()
    }
    
    func fetchBooksList() { booksList = BookData.books }
}


class RowViewModell: ObservableObject {
    @Published var booksList: [BookModel] = []
    
    init() {
        fetchBooksList()
    }
    
    func fetchBooksList() {
        booksList.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Books")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "Bilinmeyen bir hata oluştu")
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? "Bilinmeyen Kitap"
                    let author = data["author"] as? String ?? ""
                    let illustrator = data["illustrator"] as? String ?? ""
                    let publisher = data["publisher"] as? String ?? ""
                    let publishDate = data["publishDate"] as? String ?? ""
                    let numberOfPages = data["numberOfPages"] as? Int ?? 0
                    let coverImage = data["coverImage"] as? String ?? ""
                 //   let bookSaver = data["bookSaver"] as? UserModel()
                    
                    
                    let book = BookModel(id: id, name: name, author: author, illustrator: illustrator, publisher: publisher, publishDate: publishDate, numberOfPages: numberOfPages, coverImage: coverImage)
                    self.booksList.append(book)
                    
                }
            }
        }
        
        func addBook(name: String) {
            let db = Firestore.firestore()
            let ref = db.collection("Books").document(name)
            ref.setData(["name" : name, "id" : "11"]) { error in
                if let error = error {
                    print(error.localizedDescription)
                }
                
            }
        }
        
    }
}

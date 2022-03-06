//
//  FavoriteModel.swift
//  Favoritebook
//
//  Created by Adem Deliaslan on 6.03.2022.
//

import Foundation
struct FavoriteModel : Identifiable {
    var id = UUID()
    var title : String
    var elements : [FavoriteElements]
}

struct FavoriteElements : Identifiable {
    var id = UUID()
    var name : String
    var imageName : String
    var description : String
}


let teoman = FavoriteElements(name: "Teoman", imageName: "teoman", description: "Rock Sanatçısı")
let sebnemFerah = FavoriteElements(name: "Şebnem Ferah", imageName: "sebnemferah", description: "Rock Sanatçısı")
let duman = FavoriteElements(name: "Duman", imageName: "duman", description: "Rock Müzik Grubu")

let favoriteBands = FavoriteModel(title: "Favori Müzisyenlerim", elements: [teoman, sebnemFerah, duman])


let kilBill = FavoriteElements(name: "Kill Bill", imageName: "killbill", description: "Etkileyici bir film.")
let pulpFiction = FavoriteElements(name: "Pulp Fiction", imageName: "pulpfiction", description: "Etkileyici bir film daha :)")
let dontLookUp = FavoriteElements(name: "Don't Look Up", imageName: "dontlookup", description: "Netflix Filmi")

let favoriteMovies = FavoriteModel(title: "Favori Filmlerim", elements: [kilBill, pulpFiction, dontLookUp])

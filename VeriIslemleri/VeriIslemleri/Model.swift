//
//  Model.swift
//  VeriIslemleri
//
//  Created by Adem Deliaslan on 4.06.2022.
//

import Foundation

struct Model: Identifiable {
    var id = UUID()
    var isim: String
    var tanim: String
}

var birinciYapilacak = Model(isim: "Elma al", tanim: "Fuji elma olsun")
var ikinciYapilacak = Model(isim: "Arabayı yıkat", tanim: "Yıkatma iç dış")
var ucuncuYapilacak = Model(isim: "Bahçeyi temizle", tanim: "Süpürge ile yap")

var yapilacaklarDizisi = [birinciYapilacak, ikinciYapilacak, ucuncuYapilacak]

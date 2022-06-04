//
//  YapildiButonu.swift
//  VeriIslemleri
//
//  Created by Adem Deliaslan on 4.06.2022.
//

import SwiftUI

struct YapildiButonu: View {
    @Binding var yapildiYapilmadi : Bool
    var body: some View {
        Button {
            yapildiYapilmadi.toggle()
        } label: {
            Text("Yapıldı / Yapılmadı")
                .font(.title)
                .padding()
        }
    }
}

//struct YapildiButonu_Previews: PreviewProvider {
//    static var previews: some View {
//        YapildiButonu(yapildiYapilmadi: )
//    }
//}

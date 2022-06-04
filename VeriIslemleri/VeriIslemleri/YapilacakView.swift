//
//  YapilacakView.swift
//  VeriIslemleri
//
//  Created by Adem Deliaslan on 4.06.2022.
//

import SwiftUI

struct YapilacakView: View {
    var body: some View {
        NavigationView{
            List(yapilacaklarDizisi) { yapilacak in
                NavigationLink(destination: DetayView(secilenYapilacak: yapilacak), label: {
                    Text(yapilacak.isim)
                })
            } .navigationTitle("Listeler")
               
            
        }
    }
}

struct YapilacakView_Previews: PreviewProvider {
    static var previews: some View {
        YapilacakView()
    }
}

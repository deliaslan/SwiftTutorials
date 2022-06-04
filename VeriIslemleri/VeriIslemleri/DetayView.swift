//
//  DetayView.swift
//  VeriIslemleri
//
//  Created by Adem Deliaslan on 4.06.2022.
//

import SwiftUI

struct DetayView: View {
    var secilenYapilacak : Model
    
    @State var yapildi = false
    
    var body: some View {
      
            VStack{
                Text(secilenYapilacak.isim)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(yapildi ? .green : .red) //değişken gösteriminin güzel yolu
                
                Text(secilenYapilacak.tanim)
                    .font(.title)
                    .padding()
                
                
               YapildiButonu(yapildiYapilmadi: $yapildi)

            }.navigationTitle(Text("Detaylar")) //tekrar navigationview tanımlamıyoruz bir önceki sayfadan gelirken navigationview özelliği ile geliyor.
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(secilenYapilacak: birinciYapilacak)
    }
}

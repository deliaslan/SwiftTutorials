//
//  ThirdView.swift
//  FirstSwiftUIAppSample
//
//  Created by Adem Deliaslan on 5.03.2022.
//

import SwiftUI

struct ThirdView: View {
    
    let myArray = ["Adem", "Çiğdem", "Şebnem", "Kerem"]
    
    var body: some View {
        
        // 1-Listeye dizideki elemanların yazdırılması işlemi
        //        List (myArray, id: \.self) { element in
        //            HStack {Image("26")
        //                .resizable()
        //                .aspectRatio(contentMode: .fit)
        //                .frame(width: 40, height: 30)
        //            Text(element)
        //                .font(.largeTitle)}
        //
        //        }
        
        // 2-ForEach ile kullanımı
        List {
            ForEach(myArray, id: \.self) { element in
                HStack {Image("26")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 30)
                    Text(element)}
            }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

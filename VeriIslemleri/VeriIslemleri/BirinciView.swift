//
//  BirinciView.swift
//  VeriIslemleri
//
//  Created by Adem Deliaslan on 4.06.2022.
//

import SwiftUI

struct BirinciView: View {
    @State var numara = 0
    @State var gosterilecek = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    numara = numara - 1
                } label: {
                    Image(systemName: "minus")
                        .font(.largeTitle)
                }
                Text(String(numara))
                    .font(.largeTitle)
                Button {
                    numara = numara + 1
                } label: {
                    Image(systemName: "plus")
                        .font(.largeTitle)
                }
            }
            
            Button {
                if numara > 10 {
                    gosterilecek.toggle()
                }
            } label: {
                Text("İkinci View Alanına Git")
                    .padding()
                    .font(.largeTitle)
            }
            .sheet(isPresented: $gosterilecek) {
                IkinciView()
            }
        }
    }
}

struct BirinciView_Previews: PreviewProvider {
    static var previews: some View {
        BirinciView()
    }
}

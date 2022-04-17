//
//  RowView.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 16.04.2022.
//

import SwiftUI

struct RowView: View {
    
//    var image: String, name: String, author: String
  
    var body: some View {
        HStack(spacing: 16) {
            Image("levent_kapadokyada")
                .resizable().scaledToFill()
                .frame(width: 100, height: 150).cornerRadius(16)
            VStack(alignment: .leading, spacing: 16) {
                Text("Levent Kapadokya'da")
                    .lineLimit(1).font(.caption).foregroundColor(Color.yellow)
                Text("Mustafa Orakçı | 2019")
                    .lineLimit(1).font(.caption2).foregroundColor(Color.yellow)
                Text("Sayfa Sayısı: 96")
                    .lineLimit(1).font(.caption2).foregroundColor(Color.yellow)
                HStack(alignment: .center, spacing: 2) {
                    Image("send").resizable().opacity(0.5).frame(width: 20, height: 20)
                    Text("Timaş Çocuk")
                        .font(.caption2).foregroundColor(Color.white)
                }
            }
            Spacer()
            VStack(alignment: .trailing) {
                Label("Favorite", systemImage: "heart.fill")
                    .labelStyle(.iconOnly)
                    .foregroundColor(.white)
                Spacer()
            }.padding()
        }
        .padding(16)
        .background(.indigo)
        .cornerRadius(16)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView()
    }
}

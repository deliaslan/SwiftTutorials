//
//  RowView.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 16.04.2022.
//

import SwiftUI

struct RowView: View {
    
    var image: String, name: String, author: String, publishDate: String, publisher: String, numberOfPages: Int
  
    var body: some View {
        ZStack {
//            Color.purple_color.edgesIgnoringSafeArea(.all)
        HStack {
            Image(image)
                .resizable().scaledToFill()
                .frame(width: 140, height: 206).cornerRadius(16)
            VStack(alignment: .leading, spacing: 16) {
                Text(name)
                    .lineLimit(2).modifier(KGFont(type: .bold, size: 18)).foregroundColor(Color.text_color)
//                    .lineLimit(2).font(.headline).foregroundColor(Color.placeholder_color)
                Text("\(author) | \(publishDate)")
                    .lineLimit(2).modifier(KGFont(type: .bold, size: 14)).foregroundColor(Color.text_color)
                Text("Sayfa Sayısı: \(numberOfPages)")
                    .lineLimit(1).modifier(KGFont(type: .bold, size: 14)).foregroundColor(Color.text_color)
                Divider()
                HStack(alignment: .center, spacing: 2) {
//                    Image("send").resizable().opacity(0.5).frame(width: 20, height: 20)
                    Text("\(publisher)")
                        .lineLimit(1).modifier(KGFont(type: .bold, size: 14)).foregroundColor(Color.pink_darkest_color)
                    Spacer()
                    Label("Favorite", systemImage: "heart.fill")
                        .labelStyle(.iconOnly)
                        .foregroundColor(.pink_darkest_color)
                    
                        
                }
            }
            Spacer()
        }
        .padding(16)
//        .background(Color.gray_light_color)
        .background(
            LinearGradient(gradient: Gradient(colors: [.gray_3, .gray_1]), startPoint: .leading, endPoint: .bottom)
        )
        .cornerRadius(16)
    }
    }
}



struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(image: "levent_kapadokyada", name: "Levent Kapadokya'da", author: "Mustafa Orakçı", publishDate: "2019", publisher: "Timaş Çocuk", numberOfPages: 96)
    }
}

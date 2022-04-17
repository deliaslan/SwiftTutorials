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
        HStack {
            Image(image)
                .resizable().scaledToFill()
                .frame(width: 140, height: 226).cornerRadius(16)
                .padding(5)
            VStack(alignment: .leading, spacing: 16) {
                Text(name)
                    .lineLimit(2).modifier(KGFont(type: .bold, size: 18)).foregroundColor(Color.text_color)
//                    .lineLimit(2).font(.headline).foregroundColor(Color.placeholder_color)
                Text("\(author) | \(publishDate)")
                    .lineLimit(2).font(.caption).foregroundColor(Color.text_color)
                Text("Sayfa Sayısı: \(numberOfPages)")
                    .lineLimit(1).font(.caption2).foregroundColor(Color.text_color)
                Divider()
                HStack(alignment: .center, spacing: 2) {
//                    Image("send").resizable().opacity(0.5).frame(width: 20, height: 20)
                    Text("\(publisher)")
                        .lineLimit(1).font(.caption2).foregroundColor(Color.pink_darkest_color)
                    Spacer()
                    Label("Favorite", systemImage: "heart.fill")
                        .labelStyle(.iconOnly)
                        .foregroundColor(.pink_darkest_color)
                        
                }
            }
            Spacer()
        }
        .padding(16)
        .background(Color.green_light_color)
        .cornerRadius(16)
    }
}


//
//struct RowView_Previews: PreviewProvider {
//    static var previews: some View {
//        RowView()
//    }
//}

//
//  ContentView.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 16.04.2022.
//

import SwiftUI


struct ContentView: View {
   
    @StateObject var viewModel = RowViewModel()
    
    var body: some View {
        ZStack {
            Color.green_bluish_color.edgesIgnoringSafeArea(.all)
            ScrollView {  //scroll begin
                VStack (alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hey Adem,").modifier(KGFont(type: .bold, size: 20))
                                .foregroundColor(Color.pink_color).padding(.top, 16)
                            Text("Okuduğun kitaplar burada...").modifier(KGFont(type: .medium, size: 16))
                                .foregroundColor(Color.pink_color).padding(.top, 4)
                        }
                        .padding(.leading, 10)
                        Spacer()
                    }
                    Text("Kitap Listesi").modifier(KGFont(type: .bold, size: 20))
                        .foregroundColor(Color.pink_color)
                        .padding(.top, 24).padding(.bottom, 8).padding(.leading, 10)
                    ScrollView {
                        ForEach(viewModel.booksList) { model in
                            RowView(image: model.coverImage, name: model.name, author: model.author, publishDate: model.publishDate, publisher: model.publisher, numberOfPages: model.numberOfPages)
                            
                        }.padding(.leading, 10).padding(.trailing, 10)
                    }
                   
                }
            } //Scroll end
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

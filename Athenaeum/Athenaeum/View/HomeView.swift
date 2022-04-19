//
//  HomeView.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 19.04.2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = RowViewModel()

    var body: some View {
        NavigationView {
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
                    
                        ForEach(viewModel.booksList) { model in
                            NavigationLink(destination: DetailsView(model: model), label: {
                                RowView(image: model.coverImage, name: model.name, author: model.author, publishDate: model.publishDate, publisher: model.publisher, numberOfPages: model.numberOfPages)
                            })
                        }.padding(.leading, 10).padding(.trailing, 10)
                }
            } //Scroll end
            .navigationBarHidden(true)
        }
    }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}




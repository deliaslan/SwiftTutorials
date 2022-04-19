//
//  DetailsView.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 18.04.2022.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel: DetailsViewModel
    
    init(model: BookModel) {
        viewModel = DetailsViewModel(model: model)
    }
    
    var body: some View {
            NavigationView {
                ZStack {
                    Color.green_bluish_color.edgesIgnoringSafeArea(.all)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ZStack(alignment: .top) {
                                Image(viewModel.model.coverImage).resizable()
                                    .frame(height: 500).frame(maxWidth: .infinity)
                                HStack {
                                    Button(action: { self.presentationMode.wrappedValue.dismiss() },
                                           label: { Image("Left 24px").resizable().frame(width: 34, height: 34) })
                                    Spacer()
                                    Button(action: { viewModel.favouriteMethod() },
                                           label: { Image("Heart (filled)").resizable().frame(width: 26, height: 26) })
                                }.padding(.horizontal, 24).padding(.top, 46)
                            }
                            Group {
                                HStack {
                                    Text(viewModel.model.name).modifier(KGFont(type: .bold, size: 24)).lineLimit(1)
                                        .foregroundColor(Color.white_color)
                                    Spacer()
                                }.padding(.vertical,2)
                             
                                HStack(alignment: .center) {
                                    HStack(alignment: .center, spacing: 2) {
                                        Text("Yazar: \(viewModel.model.author)").modifier(KGFont(type: .regular, size: 14))
                                            .foregroundColor(Color.yellow_light_color).padding(.top, 2)
                                        
                                        Spacer()
                                        Text("\(viewModel.model.publishDate) | \(viewModel.model.publisher)").modifier(KGFont(type: .regular, size: 14))
                                            .lineLimit(1).foregroundColor(Color.yellow_light_color)
                                    }
                                }
                                HStack {
                                    Text("Resimleyen: \(viewModel.model.illustrator)").modifier(KGFont(type: .regular, size: 14))
                                        .lineLimit(1).foregroundColor(Color.yellow_light_color)
                                    Spacer()
                                }
                                Divider().padding(0)
                                VStack(spacing: 12) {
                                    HStack {
                                        Text("Kitabın Konusu").modifier(KGFont(type: .bold, size: 18))
                                            .foregroundColor(Color.white_color)
                                        Spacer()
                                    }
                                    Text(viewModel.description).modifier(KGFont(type: .regular, size: 16))
                                        .foregroundColor(Color.white_color)
                                }.padding(.vertical, 8)
                                Divider()
                                VStack(spacing: 8) {
                                    HStack {
                                        Text("Önemli Bilgiler").modifier(KGFont(type: .bold, size: 18))
                                            .foregroundColor(Color.white_color)
                                        Spacer()
                                    }
                                    HStack(spacing: 8) {
                                        DetailsInfoView(primary: "\(viewModel.model.publishDate) ", secondary: "Basım")
                                        DetailsInfoView(primary: "\(viewModel.model.numberOfPages)", secondary: "Sayfa")
                                        DetailsInfoView(primary: "\("7+")", secondary: "yaş için")
                                    }
                                }.padding(.vertical, 8)
                                
                                VStack(spacing: 16) {
                                    HStack {
                                        Text("Kitabı Kaydeden").modifier(KGFont(type: .bold, size: 18))
                                            .foregroundColor(Color.white_color)
                                        Spacer()
                                    }
                                    DetailsOwnerView(image: viewModel.model.bookSaver.image, name: viewModel.model.bookSaver.name, bio: viewModel.model.bookSaver.bio, messageMethod: viewModel.messageMethod)
                                }.padding(.vertical, 16)
                                
                                Button(action: { viewModel.adoptMethod() },
                                       label: { Text("Beni Okuma Listene Ekle").modifier(KGFont(type: .medium, size: 16)).foregroundColor(.white) })
                                    .frame(height: 50).frame(maxWidth: .infinity)
                                    .background(Color.pink_darkest_color).cornerRadius(8)
                                    .padding(.vertical, 24)
                                
                            }.padding(.horizontal, 16).padding(.top, 8)
                        }.background(Color.green_bluish_color)
                        
                        Spacer()
                        Spacer().frame(height: 150)
                    }
                    .edgesIgnoringSafeArea(.all)
                    .navigationBarHidden(true)
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }


struct DetailsOwnerView: View {
    var image: String, name: String, bio: String
    var messageMethod: () -> ()
    var body: some View {
        HStack {
            Image(image).resizable().scaledToFill().frame(width: 60, height: 60).cornerRadius(30)
            VStack(alignment: .leading, spacing: 8) {
                Text(name).modifier(KGFont(type: .medium, size: 16))
                    .foregroundColor(Color.white_color)
                Text(bio).modifier(KGFont(type: .regular, size: 14))
                    .foregroundColor(Color(hex: "828282"))
            }.padding(.leading, 8)
            Spacer()
            Button(action: { self.messageMethod() },
                   label: { Image("send").resizable().frame(width: 20, height: 20) })
                .frame(width: 45, height: 45).background(Color.green_light_color).cornerRadius(30)
        }
    }
}

struct DetailsInfoView: View {
    var primary: String, secondary: String
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 8) {
                Text(primary).modifier(KGFont(type: .medium, size: 16))
                    .foregroundColor(Color.text_color)
                Text(secondary).modifier(KGFont(type: .regular, size: 12))
                    .foregroundColor(Color(hex: "828282"))
            }
            Spacer()
        }
        .padding(.vertical, 8)
        .background(Color.green_light_color)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "DDDDDD"), lineWidth: 0.25)
        )
    }
}


struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(model: BookData.books[0])
    }
}


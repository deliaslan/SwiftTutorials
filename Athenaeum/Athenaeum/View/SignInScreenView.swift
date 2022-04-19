//
//  SignInScreenView.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 19.04.2022.
//

import SwiftUI

struct SignInScreenView: View {
    @State private var email: String = "" //deafult empty
    
    var body: some View {
            ZStack {
                Color.green_bluish_color.edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Image(systemName: "figure.walk.diamond.fill")
                        .font(.system(size: 100, weight: .ultraLight))
                        .foregroundColor(.red_primary_color)
                    
                    VStack {
                        Text("Sign In")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, 30)
                        SocialLoginButton(image: "applelogo", title: "Apple Hesabınla Giriş Yap")
                            .padding(.bottom, 5)
                        SocialLoginButton(image: "g.circle", title: "Google Hesabınla Giriş Yap")
                            .padding(.bottom, 5)
                        Text("ya da e-postana gelen linkle bağlan")
                            .font(.callout)
                            .foregroundColor(.black).opacity(0.7)
                            .padding(.vertical, 15)
                        
                        TextField("E-Posta Adresinizi Giriniz", text: $email)
                            .font(.title3)
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .background(Color.white_color)
                            .cornerRadius(50)
                            .shadow(color: Color.black.opacity(0.2), radius: 60, x: 0, y: 20)
                        PrimaryButton(title: "E-Posta adresinizle kaydolun")
                        
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    Text("Tamamen Güvenli Giriş")
                    Text("Kural ve Koşullarımızı Okuyunuz.")
                        .foregroundColor(.red)
                    Spacer()
                }.padding()
            }
    }
}

struct SocialLoginButton: View {
    var image: String
    var title: String
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.system(size: 30, weight: .ultraLight))
            Spacer()
            Text(title)
                .font(.title2)
                .padding(.vertical, 1)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white_color)
        .cornerRadius(50)
        .shadow(color: Color.black.opacity(0.2), radius: 60, x: 0, y: 20)
    }
}

struct SignInScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreenView()
    }
}

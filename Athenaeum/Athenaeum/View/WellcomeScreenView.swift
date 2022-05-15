//
//  LoginScreenView.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 19.04.2022.
//

import SwiftUI

struct WellcomeScreenView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.green_bluish_color.edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Image("wellcome_book")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                    Spacer()
                    NavigationLink(destination: SignUpScreenView().navigationBarHidden(true)) { // .navigationBarHidden(true)
                        PrimaryButton(title: "Buradan Başlayın")
                    }//.navigationBarHidden(true)
                    NavigationLink(destination: SignInScreenView().navigationBarHidden(true)) { // .navigationBarHidden(true)
                        SignInButton(title: "Giriş Yap")
                    }//.navigationBarHidden(true)
                    HStack {
                        Text("Buralarda yeni misin?")
                            .bold()
                            .foregroundColor(.white_color)
                        Text("Hemen Kaydol!")
                            .bold()
                            .foregroundColor(.red_primary_color)
                    }.padding(.vertical, 20)
                }.padding()
            }
        }
    }
}


struct PrimaryButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.white_color)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(Color.red_primary_color)
            .cornerRadius(50)
    }
}

struct SignInButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.red_primary_color)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(Color.white_color)
            .cornerRadius(50)
            .shadow(color: Color.black.opacity(0.2), radius: 60, x: 0, y: 20)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        WellcomeScreenView()
    }
}

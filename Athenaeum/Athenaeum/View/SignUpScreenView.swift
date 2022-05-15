//
//  SignUpScreenView.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 30.04.2022.
//

import SwiftUI
import Firebase

//class FireBaseManager: NSObject {
//    let auth: Auth
//
//    static let shared = FireBaseManager()
//
//    override init() {
//        FirebaseApp.configure()
//
//        self.auth = Auth.auth()
//        super.init()
//    }
//}

struct SignUpScreenView: View {
    @State private var name: String = "" //deafult empty
    @State private var email: String = "" //deafult empty
    @State private var password: String = ""
    @State var isSecureField: Bool = true

    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green_bluish_color.edgesIgnoringSafeArea(.all)
                VStack{
                    Image(systemName: "shareplay")
                        .font(.system(size: 100, weight: .ultraLight))
                        .foregroundColor(.red_primary_color)
                    
                    VStack {
                        Text("Üye Ol")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, 5)
                        
                        TextField("Ad Soyad Giriniz", text: $name)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .font(.title3)
                            .padding(14)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.black)
                            .background(Color.gray_3)
                            .cornerRadius(50)
                            .shadow(color: Color.black.opacity(0.2), radius: 60, x: 0, y: 20)
                        
                        TextField("E-posta adresinizi giriniz", text: $email)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .font(.title3)
                            .padding(14)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color.black)
                            .background(Color.gray_3)
                            .cornerRadius(50)
                            .shadow(color: Color.black.opacity(0.2), radius: 60, x: 0, y: 20)
                    
                        
                        
                        
                      
                        HStack {
                            if isSecureField{
                                SecureField("Şifrenizi giriniz", text: $password)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .font(.title3)
                                    .padding(14)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(Color.black)
                                    .background(Color.gray_3)
                                    .cornerRadius(50)
                                    .shadow(color: Color.black.opacity(0.2), radius: 60, x: 0, y: 20)
                            } else {
                                TextFieldArea(placeHolder: "Şifrenizi Giriniz", text: password)
                            }
                        }.overlay(alignment: .trailing) {
                            Image(systemName: isSecureField ? "eye.slash" : "eye")
                                .foregroundColor(Color.gray_5)
                                .padding(.trailing)
                                .onTapGesture {
                                    isSecureField.toggle()
                                }
                        }
                        
                        
                        Button {
                            FireBaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
                                if error == nil {
                                    return
                                }
                            }
                        } label: {
                            PrimaryButton(title: "Üye Ol")
                        }.padding(.bottom)
                    }

                    Divider()
                    HStack {
                        Button {
                            FireBaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
                                if error == nil {
                                    return
                                }
                            }
                        } label: {
                            NavigationLink(destination: SignInScreenView().navigationBarHidden(true)) { // .navigationBarHidden(true)
                                Text("Hesabın var mı? Giriş Yap!")
                            }//.navigationBarHidden(true)
                        }
                    }
                    .padding(.horizontal)
                    .foregroundColor(Color.black)
                    Divider()
                    Text("Kural ve Koşullarımızı Okuyunuz.")
                        .foregroundColor(.red)
                    Spacer()
                }.padding()
                Spacer()
            }
            
        }
        // .navigationBarHidden(true)
    }
}

struct TextFieldArea: View {
    var placeHolder: String = ""
    @State var text: String = ""
    
    var body: some View {
        TextField(placeHolder, text: $text)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .font(.title3)
            .padding(14)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.black)
            .background(Color.gray_3)
            .cornerRadius(50)
            .shadow(color: Color.black.opacity(0.2), radius: 60, x: 0, y: 20)
    }
}

struct SecureTextFieldArea: View {
    @State var isSecureField: Bool = true
    @State var password: String = ""
    
    var body: some View {
        HStack {
            if isSecureField{
                SecureField("Şifrenizi giriniz", text: $password)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(.title3)
                    .padding(14)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color.black)
                    .background(Color.gray_3)
                    .cornerRadius(50)
                    .shadow(color: Color.black.opacity(0.2), radius: 60, x: 0, y: 20)
            } else {
                TextFieldArea(placeHolder: "Şifrenizi Giriniz", text: password)
            }
        }.overlay(alignment: .trailing) {
            Image(systemName: isSecureField ? "eye.slash" : "eye")
                .foregroundColor(Color.gray_5)
                .padding(.trailing)
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
    }
}

struct SignUpScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreenView()
    }
}

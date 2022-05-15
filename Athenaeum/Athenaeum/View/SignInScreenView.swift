//
//  SignInScreenView.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 19.04.2022.
//

import SwiftUI
import Firebase

class FireBaseManager: NSObject {
    let auth: Auth
    
    static let shared = FireBaseManager()
    
    override init() {
        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        super.init()
    }
}




struct SignInScreenView: View {
    @State private var email: String = "" //deafult empty
    @State private var password: String = ""
    @State var isSecureField: Bool = true
    @State private var isUserLogedIn: Bool = false
    
    
    var body: some View {
        if isUserLogedIn {
            //go somewhere
            HomeView()
        } else {
            content
        }
}
    
    var content: some View {
        NavigationView {
            ZStack {
                Color.green_bluish_color.edgesIgnoringSafeArea(.all)
                VStack{
                    Image(systemName: "figure.walk.diamond.fill")
                        .font(.system(size: 100, weight: .ultraLight))
                        .foregroundColor(.red_primary_color)
                    
                    VStack {
                        Text("Giriş Yap")
                            .font(.largeTitle)
                            .bold()
                            .padding(.bottom, 5)
                        NavigationLink(destination: HomeView().navigationBarHidden(true) ) {
                            SocialLoginButton(image: "applelogo", title: "Apple Hesabınla Giriş Yap")
                                .foregroundColor(Color.black)
                                .padding(.bottom, 5)
                        }
                        
                        Text("ya da e-posta ve şifrenle giriş için")
                            .font(.callout)
                     
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
                            FireBaseManager.shared.auth.signIn(withEmail: email, password: password) { result, error in
                                if email == "" && password == "" {
                                    print("Şifre ve eposta alanı boş bırakılamaz")
                                } else {
                                    if error == nil {
                                        print("Giriş Başarılı")
                                        isUserLogedIn = true
                                    } else {
                                        print("kullanıcı hatalı girildi")
                                    }
                                                                 
                                }
                            }
                        } label: {
                            PrimaryButton(title: "Giriş Yap")
                        }
                      
                        
                    }
                    
                    
                    HStack {
                        Button {
                            
                        } label: {
                            
                            NavigationLink(destination: SignUpScreenView().navigationBarHidden(true)) { // .navigationBarHidden(true)
                                //  PrimaryButton(title: "Buradan Başlayın")
                                Text("Hasabın yok mu? Kayıt Ol!")
                            }//.navigationBarHidden(true)
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Şifremi Unuttum!")
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

struct SocialLoginButton: View {
    var image: String
    var title: String
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.system(size: 18, weight: .ultraLight))
            Spacer()
            Text(title)
                .font(.title2)
                .padding(.vertical, 1)
            Spacer()
        }
        .padding(14)
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

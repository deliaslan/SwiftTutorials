//
//  ContentView.swift
//  Firebase101
//
//  Created by Adem Deliaslan on 28.05.2022.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore

struct ContentView: View {
    @State private var showingAlert = false
    @ObservedObject var model = ViewModel()
    
    //    private var db: Firestore
    @State var sinifAdi = ""
    @State var name = ""
    @State var surname = ""
    @State var donanimAriza = ""
    @State var yazilimAriza = ""
    @State var digerAriza = ""
    
    
    init() {
        model.getData()
    }
    
    var body: some View {
        NavigationView {
            VStack{
                VStack(spacing: 5) {
                    HStack{
                        Text("Sınıf Adı").bold()
                            .frame(width: 70, alignment: .leading)
                        Text(":").bold()
                            .frame(alignment: .trailing)
                        TextField("Sınıf Adı", text: $sinifAdi)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                    }
                    HStack{
                        Text("Ad").bold()
                            .frame(width: 70, alignment: .leading)
                        Text(":").bold()
                            .frame(alignment: .trailing)
                        TextField("Ad", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                    }
                    HStack{
                        Text("Soyad").bold()
                            .frame(width: 70, alignment: .leading)
                        Text(":").bold()
                            .frame(alignment: .trailing)
                        TextField("Soyad", text: $surname)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                    }
                    HStack{
                        Text("Yaz.Arz.").bold()
                            .frame(width: 70, alignment: .leading)
                        Text(":").bold()
                            .frame(alignment: .trailing)
                        TextField("Yazılım Arıza", text: $yazilimAriza)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                    }
                    HStack{
                        Text("Don.Arz.").bold()
                            .frame(width: 70, alignment: .leading)
                        Text(":").bold()
                            .frame(alignment: .trailing)
                        TextField("Donanım Arıza", text: $donanimAriza)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                    }
                    HStack{
                        Text("Diğ.Arz.").bold()
                            .frame(width: 70, alignment: .leading)
                        Text(":").bold()
                            .frame(alignment: .trailing)
                        TextField("Diğer Arıza", text: $digerAriza)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .disableAutocorrection(true)
                    }
                    Button (action: {
                        //call add data
                        if sinifAdi == "" {
                            //alert state true
                            showingAlert = true
                        }else {
                            model.addData(sinifAdi: sinifAdi, yazilimAriza: yazilimAriza, donanimAriza: donanimAriza, digerAriza: digerAriza, name: name, surname: surname)
                        }
                        //clear  the text fields
                        name = ""
                        surname = ""
                        sinifAdi = ""
                        yazilimAriza = ""
                        donanimAriza = ""
                        digerAriza = ""
                    }, label: {
                        Text("Kontrol Bilgisi Ekle")
                            .bold()
                        
                    }).buttonStyle(BorderedButtonStyle())
                        .cornerRadius(5)
                        .alert("Sınıf Adı Boş Bırakılamaz!", isPresented: $showingAlert, actions: {
                            Button("Tamam", role: .cancel, action: {})
                        })
                    
                }
                .padding()
                Divider()
                Spacer()
                
                
                List(model.list) { item in
                    NavigationLink(destination: DetailsView()){
                        HStack {
                            VStack(alignment: .leading){
                                HStack{
                                    Text("Sınıf: ")
                                    Text(item.sinifAdi)
                                }
                                HStack{
                                    Text("Sın. Öğrt.: ")
                                    Text(item.name)
                                    Text(item.surname)
                                }
                            }
                            Spacer()
                            //update button
//                            Button {
//                                model.updateData(taskToUpdate: item)
//                            } label: {
//                                Image(systemName: "pencil")
//                            }
//                            .buttonStyle(BorderedButtonStyle())
//                            //delete button
                            
                            Button {
                                model.deleteData(taskToDelete: item)
                            } label: {
                                Image(systemName: "minus.circle")
                            }
                            .buttonStyle(BorderedButtonStyle())
                            
                        }
                        .lineLimit(2)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitle("Arıza Ekleme Sayfası")
        }
        .navigationTitle("Text")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


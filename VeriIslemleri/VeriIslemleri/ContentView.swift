//
//  ContentView.swift
//  VeriIslemleri
//
//  Created by Adem Deliaslan on 4.06.2022.
//

import SwiftUI

struct ContentView: View {
   @State var meslek = "Öğretmen"
    
    var body: some View {
        VStack{
            Text(meslek)
                .font(.largeTitle)
                .padding()
            
            Button {
                meslek = "Mühendis"
            } label: {
                Text("Meslek Değiştir")
            }
            TextField("Test", text: $meslek)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 40, alignment: .center)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

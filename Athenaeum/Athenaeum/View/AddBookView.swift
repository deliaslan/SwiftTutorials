//
//  AddBookView.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 18.05.2022.
//

import SwiftUI

struct AddBookView: View {
    @EnvironmentObject var bookModel: RowViewModell
    @State private var name = ""
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .padding()
                .background(Color.gray_3)
            Button {
                //add book
              //  bookModel.addBook(name: name)
            } label: {
                Text("Kaydet")
            }
            .padding()
            .background(Color.gray_5)
            .cornerRadius(15.0)

        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
   

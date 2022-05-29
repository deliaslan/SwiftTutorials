//
//  ContentView.swift
//  Firebase101
//
//  Created by Adem Deliaslan on 28.05.2022.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    
    private var db: Firestore
    
    init() {
        db = Firestore.firestore()
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

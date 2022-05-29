//
//  Firebase101App.swift
//  Firebase101
//
//  Created by Adem Deliaslan on 28.05.2022.
//

import SwiftUI
import Firebase

@main
struct Firebase101App: App {
    
    //firebase uygulama çalıştırıldığında çağırılıyor.
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

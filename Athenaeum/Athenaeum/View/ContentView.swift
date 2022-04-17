//
//  ContentView.swift
//  Athenaeum
//
//  Created by Adem Deliaslan on 16.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {VStack {
            RowView()
            RowView()
            RowView()
            RowView()
            RowView()
            RowView()
        }
            .padding()}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

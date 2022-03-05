//
//  ContentView.swift
//  FirstSwiftUIAppSample
//
//  Created by Adem Deliaslan on 5.03.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Text("Adem Deliaslan")
                .padding()
                .font(.title)
                .foregroundColor(.green)
                .multilineTextAlignment(.center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

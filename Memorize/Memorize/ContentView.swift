//
//  ContentView.swift
//  Memorize
//
//  Created by Adem Deliaslan on 1.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
    }
}

//defining struct method to create card
struct CardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(lineWidth: 3)
            Text("Hello World")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}

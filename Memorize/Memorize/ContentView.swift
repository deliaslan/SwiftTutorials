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
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
    }
}

//defining struct method to create card
struct CardView: View {
    var isFaceUp: Bool //value gives in using like parameters
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20.0)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(lineWidth: 3)
                Text("✈️").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20.0)
                    .fill()
            }
           
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
    
}

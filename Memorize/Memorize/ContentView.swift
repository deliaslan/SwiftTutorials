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
            CardView(content: "🚀")
            CardView(content: "🚁")
            CardView(content: "🚌")
            CardView(content: "🚙")
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
    }
}

//defining struct method to create card
struct CardView: View {
    @State var isFaceUp: Bool  = true//value gives in using like parameters
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
               shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp //changing the value in memory with @State
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
        ContentView()
            .preferredColorScheme(.dark)
    }
    
}

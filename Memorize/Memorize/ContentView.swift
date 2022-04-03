//
//  ContentView.swift
//  Memorize
//
//  Created by Adem Deliaslan on 1.04.2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚀","🚁","🚌","🚙","🚓","🚜","🚍","🏎","🛺","🚖","🚡","🚆","🛻","🚢","🚔","🛵","🏍","🚛","🚕","🚑","🚚","🚒","🚝","🚲"]
    @State var emojiCount = 20
    
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))] ){ //adjust the elements minimum size
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(3 / 4, contentMode: .fit)
                    }
                }
            }.foregroundColor(.red)
            Spacer()
            HStack {
              //  add
               // Spacer()
              //  remove
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
//    var remove: some View {
//        Button(action: {
//            if emojiCount < 24 {
//                emojiCount += 1
//            }
//        }, label: {
//            Image(systemName: "plus.circle")
//        })
//    }
//
//    var add: some View {
//        Button(action: {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        }, label: {
//            Image(systemName: "minus.circle")
//        })
//    }
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
                    .strokeBorder(lineWidth: 3) //draw the line inside of the element
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

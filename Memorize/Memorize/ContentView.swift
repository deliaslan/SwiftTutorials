//
//  ContentView.swift
//  Memorize
//
//  Created by Adem Deliaslan on 1.04.2022.
// VIEW

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
       
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))] ){ //adjust the elements minimum size
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(3 / 4, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }.foregroundColor(.red)
             .padding(.horizontal)
    }
}

//defining struct method to create card
struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3) //draw the line inside of the element
                Text(card.content).font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }.padding(1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
            ContentView(viewModel: game)
        }
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
    
}

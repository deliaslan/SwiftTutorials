//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Adem Deliaslan on 1.04.2022.
// VIEW

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))] ){ //adjust the elements minimum size
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(3 / 4, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }.foregroundColor(.red)
            .padding(.horizontal)
    }
}

//defining struct method to create card
struct CardView: View {
    let card: EmojiMemoryGame.Card //MemoryGame<String>.Card  clean code
    
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
            } else if card.isMatch {
                shape.opacity(0)
            }
            else {
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
            EmojiMemoryGameView(game: game)
        }
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
    
}

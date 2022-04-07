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
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth) //draw the line inside of the element
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatch {
                    shape.opacity(DrawingConstants.opacity)
                }
                else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        return Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
        static let opacity: CGFloat = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        Group {
        //    EmojiMemoryGameView(game: game)
        }
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}

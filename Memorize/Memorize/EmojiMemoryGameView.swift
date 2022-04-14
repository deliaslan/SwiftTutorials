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
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            if card.isMatch && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        })
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

//defining struct method to create card
struct CardView: View {
    let card: EmojiMemoryGame.Card //MemoryGame<String>.Card  clean code
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatch ?  360 : 0))
                    .animation(Animation.easeInOut(duration: 2).repeatForever())
                    .font(font(in: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func font(in size: CGSize) -> Font {
        return Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.70
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

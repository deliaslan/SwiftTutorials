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
        VStack{
            gameBody
            deckBody
            shuffle
        }
        .padding()
    }
    
    @State private var dealt = Set<Int>()
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
        !dealt.contains(card.id)
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if isUndealt(card) || card.isMatch && !card.isFaceUp {
                //Rectangle().opacity(0) //the best way is int the below
                Color.clear
            } else {
                CardView(card: card)
                    .padding(4)
//                    .transition(AnyTransition.scale.animation(Animation.easeInOut(duration: 1)))
                    .transition(AnyTransition.asymmetric(insertion: .scale, removal: .opacity).animation(.easeInOut(duration: 1)))
                    .onTapGesture {
                        withAnimation {  //(.easeInOut(duration: 2))
                            game.choose(card)
                        }
                       
                    }
            }
        }
        .onAppear {
            //deal cards
            withAnimation {
                for card in game.cards {
                    deal(card)
                }
            }
        }
        .foregroundColor(CardConstants.color)
    }
    
    var deckBody: some View {
        ZStack {
            ForEach(game.cards.filter(isUndealt)) { card in
                CardView(card: card)
            }
        }
        .frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
        .foregroundColor(CardConstants.color)
    }
    
    var shuffle: some View {
        Button("Shuffle"){
            withAnimation{
                game.shuffle()
            }
            
        }
    }
    
    private struct CardConstants {
        static let color = Color.red
        static let aspectRatio: CGFloat = 2/3
        static let dealDuration: Double = 0.5
        static let totalDealDuration: Double = 2
        static let undealtHeight: CGFloat = 90
        static let undealtWidth: CGFloat = undealtHeight * aspectRatio
        
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
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    //    private func font(in size: CGSize) -> Font {
    //        return Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    //    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.70
        static let fontSize: CGFloat  = 32
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

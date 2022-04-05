//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Adem Deliaslan on 3.04.2022.
// VIEWMODEL

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    static  let emojis = ["🚀","🚁","🚌","🚙","🚓","🚜","🚍","🏎","🛺","🚖","🚡","🚆","🛻","🚢","🚔","🛵","🏍","🚛","🚕","🚑","🚚","🚒","🚝","🚲"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

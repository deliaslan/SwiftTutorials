//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Adem Deliaslan on 3.04.2022.
//

import SwiftUI



class EmojiMemoryGame {
    
    static  let emojis = ["🚀","🚁","🚌","🚙","🚓","🚜","🚍","🏎","🛺","🚖","🚡","🚆","🛻","🚢","🚔","🛵","🏍","🚛","🚕","🚑","🚚","🚒","🚝","🚲"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}

//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Adem Deliaslan on 3.04.2022.
//

import SwiftUI


class EmojiMemoryGame {
    private var model: MemoryGame<String> = MemoryGame(numberOfPairOfCards: 4, createCardContent: { _ in "😀" })
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    
}

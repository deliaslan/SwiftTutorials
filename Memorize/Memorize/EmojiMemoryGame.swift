//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Adem Deliaslan on 3.04.2022.
//

import SwiftUI

func makeCardContent(index: Int) -> String {  // this func will be unnecessary using like this
    return "😀"
}

class EmojiMemoryGame {
    private var model: MemoryGame<String> = MemoryGame(numberOfPairOfCards: 4, createCardContent: { index in
        return "😀"
    })
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    
}

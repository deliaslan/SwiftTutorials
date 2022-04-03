//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Adem Deliaslan on 3.04.2022.
//

import Foundation

struct MemoryGame<CardContent>{
    var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatch: Bool = false
        var content: CardContent //bu elementi biz uydurduk. İçeriğin ne olduğu bizi ilgilendirmiyor dolayısıyla resimmi yazımı o kısımla ilgilenmiyoruz.
    }
}

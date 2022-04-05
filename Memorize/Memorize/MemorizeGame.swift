//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Adem Deliaslan on 3.04.2022.
// MODEL

import Foundation

struct MemoryGame<CardContent>{
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("Cards = \(cards)")
    }
    
    func index(of card: Card) -> Int{
        for index in 0..<cards.count{
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 //fake response
    }
    
    init(numberOfPairOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content,id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatch: Bool = false
        var content: CardContent //bu elementi biz uydurduk. İçeriğin ne olduğu bizi ilgilendirmiyor dolayısıyla resimmi yazımı o kısımla ilgilenmiyoruz.
        var id: Int
    }
}

//
//  MemoryGame.swift
//  Memorize
//
//  Created by Angelica Figueroa Muniz on 11/7/21.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card){
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: <#T##CardContent#>))
            cards.append(Card(content: <#T##CardContent#>))

        }
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMarched: Bool = false
        var content: CardContent
    }
}

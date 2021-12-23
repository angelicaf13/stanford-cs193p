//
//  MemoryGame.swift
//  Memorize
//
//  Created by Angelica Figueroa Muniz on 11/7/21.
//  This is the Model.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? // Int? to initialize to nil
    
    mutating func choose(_ card: Card){ // add mutating to say that this function is going to change this whole struct
//        if let chosenIndex = index(of: card) { //if index() returns an int
        if let chosenIndex = cards.firstIndex(where: {  $0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }

            //var chosenCard = cards[chosenIndex] //makes a copy
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("chosenCard = \(cards)")
    }
    
//    func index(of card: Card) -> Int? { // Int? -> makes the return value optional so we can return nil if the card is not found
//        for index in 0..<cards.count {
//            if cards[index].id == card.id {
//                return index
//            }
//        }
//        return nil
//    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        // add numberOfPairsOfCards x 2 cards to
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))

        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

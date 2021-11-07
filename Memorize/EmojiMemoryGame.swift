//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Angelica Figueroa Muniz on 11/7/21.
//

import SwiftUI


class EmojiMemoryGame {

    // static only exists once in the entire time, is only created once, works like a global constant or function
    static let emojis = ["🦁", "🐯", "🐨", "🐻‍❄️", "🐼", "🐶", "🐱", "🐭", "🐷", "🐮", "🐥", "🦉", "🐊", "🐸", "🦩", "🐴", "🦅", "🐺", "🐔", "🐧", "🐵", "🦊"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex] // the full name will be EmojiMemoryGame.emojis, but we dont need because of static
        }
    }
    
    // this exists on every instance of the class
    private var model: MemoryGame<String> = createMemoryGame() // the full name will be EmojiMemoryGame.createMemoryGame, but we dont need because of static
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}

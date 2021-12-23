//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Angelica Figueroa Muniz on 11/7/21.
//  This is the ViewModel.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {

    // static only exists once in the entire time, is only created once, works like a global constant or function
    static let emojis = ["🦁", "🐯", "🐨", "🐻‍❄️", "🐼", "🐶", "🐱", "🐭", "🐷", "🐮", "🐥", "🦉", "🐊", "🐸", "🦩", "🐴", "🦅", "🐺", "🐔", "🐧", "🐵", "🦊"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex] // the full name will be EmojiMemoryGame.emojis, but we dont need because of static
        }
    }
    
    // this exists on every instance of the class
    @Published private var model: MemoryGame<String> = createMemoryGame() // the full name will be EmojiMemoryGame.createMemoryGame, but we dont need because of static
    //the model is a struct, so swift can check for changes that happen there
    //with @Published will call objectWillChange.send
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

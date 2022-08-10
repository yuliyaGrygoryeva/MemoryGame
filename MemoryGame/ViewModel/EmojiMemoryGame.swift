//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Yuliya  on 8/9/22.
//

import Foundation

class EmojiMemoryGame {
    private var model: MemoryGame<String> = MemoryGame<String>(numbersOfPairsOfCards: 2)
    
    // MARK: - access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
}

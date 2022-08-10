//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by Yuliya  on 8/9/22.
//

import Foundation

//func createCardContent(pairIndex: Int) -> String {
//    return "😀"
//}
// { _ in "😀" }

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷"]
    
        return MemoryGame<String>(numbersOfPairsOfCards: emojis.count) { pairIndex in
        return emojis[pairIndex]
            
        }
    }
    
    // var objectWillChange: ObservableObjectPublisher
    
    // MARK: - access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
}

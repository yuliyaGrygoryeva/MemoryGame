//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Yuliya  on 8/9/22.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    let game = EmojiMemoryGame()
    
    
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

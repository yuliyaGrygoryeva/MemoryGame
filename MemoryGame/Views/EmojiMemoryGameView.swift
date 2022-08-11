//
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Yuliya  on 8/9/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @StateObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                .padding(5)
            }
        
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
        
    }
    
    // MARK: - Drawing Constants
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let fontScaleFactor: CGFloat = 0.75
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

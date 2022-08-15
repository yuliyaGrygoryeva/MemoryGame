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
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
        ZStack {
            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                .padding(5).opacity((0.4))
            Text(card.content)
                .font(Font.system(size: fontSize(for: size)))
        }
        .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: - Drawing Constants
    private let fontScaleFactor: CGFloat = 0.7
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}



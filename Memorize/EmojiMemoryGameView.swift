//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

// MARK: - EmojiMemoryGameView Struct
struct EmojiMemoryGameView: View {
	// MARK: - Observed Game Object
	@ObservedObject var game: EmojiMemoryGame
	
	// MARK: - View Body
	var body: some View {
		VStack {
			gameBody
			deckBody
			shuffle
		}
		.padding()
	}
	
	@State private var dealt = Set<Int>()
	
	private func deal(_ card: EmojiMemoryGame.Card) {
		dealt.insert(card.id)
	}
	
	private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
		!dealt.contains(card.id)
	}
	
	// MARK: - Game Body
	var gameBody: some View {
		AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
			if isUndealt(card) || (card.isMatched && !card.isFaceUp) {
				Color.clear
			} else {
				CardView(card)
					.padding(4)
					.transition(AnyTransition.asymmetric(insertion: .scale, removal: .opacity).animation(.easeInOut(duration: 5)))
					.onTapGesture {
						withAnimation(.easeInOut(duration: 0.5)) {
							game.choose(card)
						}
					}
			}
		}
		.onAppear {
			// "deal" cards
			withAnimation(.easeInOut(duration: 5)) {
				for card in game.cards {
					deal(card)
				}
			}
		}
		.foregroundColor(CardConstants.color)
	}
	
	// MARK: - Deck Body
	var deckBody: some View {
		ZStack {
			ForEach(game.cards.filter(isUndealt)) { card in
				CardView(card)
					.transition(AnyTransition.asymmetric(insertion: .opacity, removal: .scale))
			}
		}
		.frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
		.foregroundColor(CardConstants.color)
		
	}
	
	var shuffle: some View {
		Button("Shuffle") {
			withAnimation(.easeInOut(duration: 0.5)) {
				game.shuffle()
			}
		}
	}
	
	private struct CardConstants {
		static let color = Color.red
		static let aspectRatio: CGFloat = 2/3
		static let dealDuration: Double = 0.5
		static let totalDealDuration: Double = 2
		static let undealtHeight: CGFloat = 90
		static let undealtWidth = undealtHeight * aspectRatio
	}
}

// MARK: - Preview Provider
struct EmojiMemoryGameView_Previews: PreviewProvider {
	static var previews: some View {
		let game = EmojiMemoryGame()
		
		EmojiMemoryGameView(game: game)
			.preferredColorScheme(.light)
		EmojiMemoryGameView(game: game)
			.preferredColorScheme(.dark)
	}
}

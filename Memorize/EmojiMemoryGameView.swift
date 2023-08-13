//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

// MARK: - EmojiMemoryGameView Struct
struct EmojiMemoryGameView: View {
	
	// MARK: - Dealing Functions
	@Namespace private var dealingNamespace
	
	@State private var dealt = Set<Int>()
	
	private func deal(_ card: EmojiMemoryGame.Card) {
		dealt.insert(card.id)
	}
	
	private func isUndealt(_ card: EmojiMemoryGame.Card) -> Bool {
		!dealt.contains(card.id)
	}
	
	private func dealAnimation(for card: EmojiMemoryGame.Card) -> Animation {
		var delay = 0.0
		if let index = game.cards.firstIndex(where: { $0.id == card.id }) {
			delay = Double(index) * (CardConstants.totalDealDuration / Double(game.cards.count))
		}
		return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
	}
	
	private func zIndex(of card: EmojiMemoryGame.Card) -> Double {
		-Double(game.cards.firstIndex(where: { $0.id == card.id }) ?? 0)
	}
	
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
	
	// MARK: - Game Body
	var gameBody: some View {
		AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
			if isUndealt(card) || (card.isMatched && !card.isFaceUp) {
				Color.clear
			} else {
				CardView(card)
					.matchedGeometryEffect(id: card.id, in: dealingNamespace)
					.padding(4)
					.transition(AnyTransition.asymmetric(insertion: .identity, removal: .scale))
					.zIndex(zIndex(of: card))
					.onTapGesture {
						withAnimation {
							game.choose(card)
						}
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
					.matchedGeometryEffect(id: card.id, in: dealingNamespace)
					.transition(AnyTransition.asymmetric(insertion: .opacity, removal: .identity))
					.zIndex(zIndex(of: card))
			}
		}
		.frame(width: CardConstants.undealtWidth, height: CardConstants.undealtHeight)
		.foregroundColor(CardConstants.color)
		.onTapGesture {
			// "deal" cards
			for card in game.cards {
				withAnimation(dealAnimation(for: card)) {
					deal(card)
				}
			}
		}
	}
	
	// MARK: - Shuffle Button
	var shuffle: some View {
		Button("Shuffle") {
			withAnimation {
				game.shuffle()
			}
		}
	}
	
	// MARK: - Card Constants
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

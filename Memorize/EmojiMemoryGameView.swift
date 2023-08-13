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
			shuffle
		}
		.padding()
	}
	
	// MARK: - Game Body
	var gameBody: some View {
		AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
			if card.isMatched && !card.isFaceUp {
				Color.clear
			} else {
				CardView(card)
					.padding(4)
					.onTapGesture {
						withAnimation {
							game.choose(card)
						}
					}
			}
		}
		.foregroundColor(.red)
	}
	
	var shuffle: some View {
		Button("Shuffle") {
			withAnimation(.easeInOut(duration: 0.5)) {
				game.shuffle()
			}
		}
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

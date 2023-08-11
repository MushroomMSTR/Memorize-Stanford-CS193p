//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	@ObservedObject var game: EmojiMemoryGame
	
	var body: some View {
		AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
			CardView(card)
				.padding(4)
				.onTapGesture {
					game.choose(card)
				}
		}
		.foregroundColor(.red)
		.padding(.horizontal)
	}
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
	static var previews: some View {
		let game = EmojiMemoryGame()
		
		EmojiMemoryGameView(game: game)
			.preferredColorScheme(.light)
		EmojiMemoryGameView(game: game)
			.preferredColorScheme(.dark)
	}
}

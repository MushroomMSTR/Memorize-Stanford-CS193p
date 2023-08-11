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
		VStack {
			ScrollView {
				LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
					ForEach(game.cards) { card in
						CardView(card)
							.aspectRatio(2/3, contentMode: .fit)
							.onTapGesture {
								game.choose(card)
							}
					}
				}
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

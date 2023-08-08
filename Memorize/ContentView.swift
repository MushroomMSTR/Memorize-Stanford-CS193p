//
//  ContentView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

struct ContentView: View {
	let viewModel: EmojiMemoryGame
	
	var body: some View {
		VStack {
			ScrollView {
				LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
					ForEach(viewModel.cards) { card in
						CardView(card: card)
							.aspectRatio(2/3, contentMode: .fit)
							.onTapGesture {
								viewModel.choose(card)
							}
					}
				}
			}
		}
		.padding(.horizontal)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		let game = EmojiMemoryGame()
		
		ContentView(viewModel: game)
			.preferredColorScheme(.light)
		ContentView(viewModel: game)
			.preferredColorScheme(.dark)
	}
}

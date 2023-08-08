//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by NazarStf on 08.08.2023.
//

import SwiftUI

func makeCardContent(index: Int) -> String {
	return "😉"
}

class EmojiMemoryGame {
	private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: makeCardContent)
	
	var cards: Array<MemoryGame<String>.Card> {
		return model.cards
	}
}

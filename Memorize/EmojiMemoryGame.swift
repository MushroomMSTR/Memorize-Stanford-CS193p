//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by NazarStf on 08.08.2023.
//

import SwiftUI

class EmojiMemoryGame {
	private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4) { _ in "😉" }
	
	var cards: Array<MemoryGame<String>.Card> {
		return model.cards
	}
}

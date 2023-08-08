//
//  MemoryGame.swift
//  Memorize
//
//  Created by NazarStf on 08.08.2023.
//

import Foundation

struct MemoryGame<CardContent> {
	var cards: Array<Card>
	
	func choose(_ card: Card) {
		
	}
	
	init(numberOfPairsOfCards: Int) {
		cards = Array<Card>()
	}
	
	struct Card {
		var isFaceUp: Bool
		var isMatched: Bool
		var content: CardContent
	}
}

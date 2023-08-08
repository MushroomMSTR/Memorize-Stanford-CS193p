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
	
	init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
		cards = Array<Card>()
		
		for pairIndex in 0..<numberOfPairsOfCards {
			let content = createCardContent(pairIndex)
			cards.append(Card(id: pairIndex*2, content: content))
			cards.append(Card(id: pairIndex*2+1, content: content))
		}
	}
	
	struct Card: Identifiable {
		var id: Int
		var isFaceUp: Bool = false
		var isMatched: Bool = false
		var content: CardContent
	}
}

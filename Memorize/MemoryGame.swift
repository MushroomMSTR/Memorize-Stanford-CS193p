//
//  MemoryGame.swift
//  Memorize
//
//  Created by NazarStf on 08.08.2023.
//

import Foundation

struct MemoryGame<CardContent> {
	private(set) var cards: Array<Card>
	
	mutating func choose(_ card: Card) {
		let chosenIndex = index(of: card)
		cards[chosenIndex].isFaceUp.toggle()
	}
	
	func index(of card: Card) -> Int {
		for index in 0..<cards.count {
			if cards[index].id == card.id {
				return index
			}
		}
		return 0
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
		var isFaceUp: Bool = true
		var isMatched: Bool = false
		var content: CardContent
	}
}

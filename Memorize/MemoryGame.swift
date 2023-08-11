//
//  MemoryGame.swift
//  Memorize
//
//  Created by NazarStf on 08.08.2023.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
	private(set) var cards: Array<Card>
	
	private var indexOfTheOneAndOnlyFaceUpCard: Int? {
		var faceUpCardIndices = [Int]()
		for index in cards.indices {
			if cards[index].isFaceUp {
				faceUpCardIndices.append(index)
			}
		}
		if faceUpCardIndices.count == 1 {
			return faceUpCardIndices.first
		} else {
			return nil
		}
	}
	
	mutating func choose(_ card: Card) {
		if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[chosenIndex].isFaceUp,
		   !cards[chosenIndex].isMatched {
			if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
				if cards[chosenIndex].content == cards[potentialMatchIndex].content {
					cards[chosenIndex].isMatched = true
					cards[potentialMatchIndex].isMatched = true
				}
				cards[chosenIndex].isFaceUp = true
			} else {
				for index in cards.indices {
					cards[index].isFaceUp = false
				}
				cards[chosenIndex].isFaceUp = true // This sets the chosen card as the one and only face-up card
			}
		}
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
		cards = []
		
		for pairIndex in 0..<numberOfPairsOfCards {
			let content = createCardContent(pairIndex)
			cards.append(Card(id: pairIndex*2, content: content))
			cards.append(Card(id: pairIndex*2+1, content: content))
		}
	}
	
	struct Card: Identifiable {
		var isFaceUp = false
		var isMatched = false
		let id: Int
		let content: CardContent
	}
}

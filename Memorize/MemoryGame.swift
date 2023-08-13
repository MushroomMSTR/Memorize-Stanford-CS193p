//
//  MemoryGame.swift
//  Memorize
//
//  Created by NazarStf on 08.08.2023.
//

import Foundation

// MARK: - Memory Game
struct MemoryGame<CardContent: Equatable> {
	// MARK: - Properties
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
	
	// MARK: - Card Management
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
	
	mutating func shuffle() {
		cards.shuffle()
	}
	
	// MARK: - Initialization
	init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
		cards = []
		
		for pairIndex in 0..<numberOfPairsOfCards {
			let content = createCardContent(pairIndex)
			cards.append(Card(id: pairIndex*2, content: content))
			cards.append(Card(id: pairIndex*2+1, content: content))
		}
		cards.shuffle()
	}
	
	// MARK: - Card Struct
	struct Card: Identifiable {
		var isFaceUp = false {
			didSet {
				if isFaceUp {
					startUsingBonusTime()
				} else {
					stopUsingBonusTime()
				}
			}
		}
		var isMatched = false {
			didSet {
				stopUsingBonusTime()
			}
		}
		let id: Int
		let content: CardContent
		// MARK: - Bonus Time
		var bonusTimeLimit: TimeInterval = 6
		
		// how long this card has ever been face up
		private var faceUpTime: TimeInterval {
			if let lastFaceUpDate = self.lastFaceUpDate {
				return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
			} else {
				return pastFaceUpTime
			}
		}
		// the last time this card was turned face up (and is still face up)
		var lastFaceUpDate: Date?
		// the accumulated time this card has been face up in the past
		// (i.e. not including the current time it's been face up if it is currently so)
		var pastFaceUpTime: TimeInterval = 0
		
		// how much time left before the bonus opportunity runs out
		var bonusTimeRemaining: TimeInterval {
			max(0, bonusTimeLimit - faceUpTime)
		}
		// percentage of the bonus time remaining
		var bonusRemaining: Double {
			(bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
		}
		// whether the card was matched during the bonus time period
		var hasEarnedBonus: Bool {
			isMatched && bonusTimeRemaining > 0
		}
		// whether we are currently face up, unmatched and have not yet used up the bonus window
		var isConsumingBonusTime: Bool {
			isFaceUp && !isMatched && bonusTimeRemaining > 0
		}
		
		// called when the card transitions to face up state
		private mutating func startUsingBonusTime() {
			if isConsumingBonusTime, lastFaceUpDate == nil {
				lastFaceUpDate = Date()
			}
		}
		// called when the card goes back face down (or gets matched)
		private mutating func stopUsingBonusTime() {
			pastFaceUpTime = faceUpTime
			self.lastFaceUpDate = nil
		}
	}
}

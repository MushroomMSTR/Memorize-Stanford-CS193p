//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by NazarStf on 08.08.2023.
//

import SwiftUI

// MARK: - EmojiMemoryGame Class
class EmojiMemoryGame: ObservableObject {
	
	// MARK: - Type Alias
	typealias Card = MemoryGame<String>.Card
	
	// MARK: - Emojis Collection
	static let emojis = [
		"🛵", "✈️", "⛺️", "⛵️", "⛷️", "🏄‍♂️", "🧗‍♀️", "🚗", "🚲", "🚂",
		"🚀", "🚁", "🚓", "🚕", "🚚", "🚌", "🚢", "🚤", "🚃", "🚒",
		"🐶", "🐱", "🐼", "🐨", "🐯", "🦁", "🐸", "🐵", "🦄", "🦓",
		"🎾", "⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐", "🏉", "🎱", "🏓",
		"🍎", "🍌", "🍒", "🍇", "🍓", "🍑", "🍊", "🍍", "🥭", "🍅",
		"🌍", "🌞", "🌙", "🌈", "⭐️", "🌧️", "❄️", "🌪️", "🌩️", "☔️",
		"🎹", "🎻", "🎺", "🎷", "🥁", "🪕", "🎸", "🎨", "🎭", "🎬",
		"📚", "🖊️", "📸", "💻", "📺", "📻", "📞", "🔎", "⌚️", "🔑",
		"💼", "👜", "🎒", "👓", "🕶️", "🌂", "👔", "👖", "👗", "👠",
		"🌸", "🌻", "🌼", "🌷", "🌵", "🌴", "🌲", "🎋", "🍁", "🍂"
	]
	
	// MARK: - Game Creation
	static func createMemoryGame() -> MemoryGame<String> {
		MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
			EmojiMemoryGame.emojis[pairIndex]
		}
	}
	
	// MARK: - Model
	@Published private var model = EmojiMemoryGame.createMemoryGame()
	
	// MARK: - Access to the Cards
	var cards: Array<Card> {
		model.cards
	}
	
	// MARK: - Intent(s)
	func choose(_ card: Card) {
		model.choose(card)
	}
}

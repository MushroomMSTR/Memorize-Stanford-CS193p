//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by NazarStf on 08.08.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
	
	typealias Card = MemoryGame<String>.Card
	
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
	
	static func createMemoryGame() -> MemoryGame<String> {
		MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
			EmojiMemoryGame.emojis[pairIndex]
		}
	}
	
	@Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
	
	var cards: Array<Card> {
		model.cards
	}
	
	// MARK: - Intent(s)
	
	func choose(_ card: Card) {
		model.choose(card)
	}
}

//
//  CardView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

// MARK: - CardView Structure
struct CardView: View {
	// MARK: - Properties
	let card: EmojiMemoryGame.Card
	
	// MARK: - Initialization
	init(_ card: EmojiMemoryGame.Card) {
		self.card = card
	}
	
	// MARK: - Body
	var body: some View {
		GeometryReader { geometry in
			ZStack {
				Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
					.padding(5)
					.opacity(0.5)
				Text(card.content)
					.font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.75))
			}
			.cardify(isFaceUp: card.isFaceUp)
		}
	}
}

// MARK: - Preview Provider
struct CardView_Previews: PreviewProvider {
	static var previews: some View {
		let testCard = EmojiMemoryGame.Card(isFaceUp: true, isMatched: false, id: 0, content: "🧳") // make sure to set isFaceUp and isMatched according to your requirement
		CardView(testCard)
			.padding(.horizontal)
	}
}

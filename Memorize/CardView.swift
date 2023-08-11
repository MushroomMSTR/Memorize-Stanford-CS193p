//
//  CardView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

struct CardView: View {
	let card: EmojiMemoryGame.Card
	
	init(_ card: EmojiMemoryGame.Card) {
		self.card = card
	}
	
	var body: some View {
		GeometryReader { geometry in
			ZStack {
				let shape = RoundedRectangle(cornerRadius: 10)
				
				if card.isFaceUp {
					shape
						.strokeBorder(lineWidth: 3)
						.foregroundColor(.red)
					Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
						.padding(5)
						.opacity(0.5)
					Text(card.content)
						.font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.75))
				} else if card.isMatched {
					shape.opacity(0)
				} else {
					shape.fill()
				}
			}
		}
	}
}

struct CardView_Previews: PreviewProvider {
	static var previews: some View {
		let testCard = EmojiMemoryGame.Card(isFaceUp: true, isMatched: false, id: 0, content: "🧳") // make sure to set isFaceUp and isMatched according to your requirement
		CardView(testCard)
			.padding(.horizontal)
	}
}

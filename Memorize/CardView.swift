//
//  CardView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

struct CardView: View {
	let card: MemoryGame<String>.Card
	
	var body: some View {
		ZStack {
			let shape = RoundedRectangle(cornerRadius: 20)
			
			if card.isFaceUp {
				shape
					.strokeBorder(lineWidth: 3)
					.foregroundColor(.red)
				Text(card.content)
					.font(.largeTitle)
			} else if card.isMatched {
				shape.opacity(0)
			} else {
				shape.fill()
			}
		}
	}
}

struct CardView_Previews: PreviewProvider {
	static var previews: some View {
		let testCard = MemoryGame<String>.Card(id: 0, content: "🧳")
		CardView(card: testCard)
			.padding(.horizontal)
	}
}

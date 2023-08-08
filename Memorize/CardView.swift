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
			} else {
				shape
					.fill()
			}
			
		}
	}
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//		CardView(card: "🧳")
//			.padding(.horizontal)
//    }
//}

//
//  CardView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

// MARK: - CardView Structure
struct CardView: View {
	
	@State private var animatedBonusRemaining: Double = 0
	
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
				Group {
					if card.isConsumingBonusTime {
						Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-animatedBonusRemaining)*360-90))
							.onAppear {
								animatedBonusRemaining = card.bonusRemaining
								withAnimation(.linear(duration: card.bonusTimeRemaining)) {
									animatedBonusRemaining = 0
								}
							}
					} else {
						Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: (1-card.bonusRemaining)*360-90))
					}
				}
					.padding(5)
					.opacity(0.5)
				Text(card.content)
					.rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
					.animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: card.isMatched)
					.padding(5)
					.font(Font.system(size: DrawingConstants.fontSize))
					.scaleEffect(scale(thatFits: geometry.size))
			}
			.cardify(isFaceUp: card.isFaceUp)
		}
	}
	private func scale(thatFits size: CGSize) -> CGFloat {
		min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
	}
	
	private struct DrawingConstants {
		static let fontScale: CGFloat = 0.7
		static let fontSize: CGFloat = 32
	}
}

// MARK: - Preview Provider
struct CardView_Previews: PreviewProvider {
	static var previews: some View {
		let testCard = EmojiMemoryGame.Card(isFaceUp: true, isMatched: false, id: 0, content: "🧳")
		CardView(testCard)
			.padding(.horizontal)
	}
}

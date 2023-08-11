//
//  Cardify.swift
//  Memorize
//
//  Created by NazarStf on 11.08.2023.
//

import SwiftUI

// MARK: - Cardify Modifier
struct Cardify: AnimatableModifier {
	// MARK: - Initialization
	init(isFaceUp: Bool) {
		rotation = isFaceUp ? 0 : 180
	}
	
	// MARK: - Animatable Data
	var animatableData: Double {
		get { rotation }
		set { rotation = newValue }
	}
	
	var rotation: Double
	
	// MARK: - Body
	func body(content: Content) -> some View {
		ZStack {
			let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
			if rotation < 90 {
				shape.fill().foregroundColor(.white)
				shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
			} else {
				shape.fill()
			}
			content
				.opacity(rotation < 90 ? 1 : 0)
		}
		.rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
	}
	
	// MARK: - Drawing Constants
	private struct DrawingConstants {
		static let cornerRadius: CGFloat = 10
		static let lineWidth: CGFloat = 3
	}
}

// MARK: - View Extension
extension View {
	func cardify(isFaceUp: Bool) -> some View {
		self.modifier(Cardify(isFaceUp: isFaceUp))
	}
}

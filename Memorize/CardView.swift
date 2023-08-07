//
//  CardView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

struct CardView: View {
	var content: String
	@State var isFaceUp: Bool = true
	
	var body: some View {
		ZStack {
			let shape = RoundedRectangle(cornerRadius: 20)
			
			if isFaceUp {
				shape
					.strokeBorder(lineWidth: 3)
					.foregroundColor(.red)
				Text(content)
					.font(.largeTitle)
			} else {
				shape
					.fill()
			}
			
		}
		.onTapGesture {
			isFaceUp = !isFaceUp
		}
	}
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView(content: "🧳")
			.padding(.horizontal)
    }
}

//
//  ContentView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

struct ContentView: View {
	@State private var emojiCount = emojis.count
	
	var body: some View {
		VStack {
			ScrollView {
				LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
					ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
						CardView(content: emoji)
							.aspectRatio(2/3, contentMode: .fit)
					}
				}
			}
		}
		.padding(.horizontal)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.preferredColorScheme(.light)
		ContentView()
			.preferredColorScheme(.dark)
	}
}

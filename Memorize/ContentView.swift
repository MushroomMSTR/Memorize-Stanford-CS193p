//
//  ContentView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

struct ContentView: View {
	@State private var emojiCount = 4
	
	var body: some View {
		VStack {
			HStack {
				ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
					CardView(content: emoji)
				}
			}
			HStack {
				Button {
					if emojiCount > 1 {
						emojiCount -= 1
					}
				} label: {
					VStack {
						Image(systemName: "minus.circle")
							.font(.largeTitle)
					}
				}
				Spacer()
				Button{
					if emojiCount < emojis.count {
						emojiCount += 1
					}
				} label: {
					VStack {
						Image(systemName: "plus.circle")
							.font(.largeTitle)
					}
				}
			}
			.padding()
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

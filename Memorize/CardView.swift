//
//  CardView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

struct CardView: View {
	var isFaceUp: Bool = true
	
	var body: some View {
		ZStack {
			let shape = RoundedRectangle(cornerRadius: 20)
			
			if isFaceUp {
				shape
					.stroke(lineWidth: 3)
					.foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
				Text("🧳")
					.font(.largeTitle)
					.fontWeight(.semibold)
			} else {
				shape
					.fill()
			}
			
		}
		.padding()
	}
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		CardView()
    }
}

//
//  ContentView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 20)
				.stroke(lineWidth: 3)
				.foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
			Text("Hello CS190")
				.font(.largeTitle)
				.fontWeight(.semibold)
		}
		.padding(.horizontal)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

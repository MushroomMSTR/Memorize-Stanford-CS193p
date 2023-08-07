//
//  ContentView.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		HStack {
			CardView()
			CardView()
			CardView()
			CardView()
		}
		.padding()
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

//
//  MemorizeApp.swift
//  Memorize
//
//  Created by NazarStf on 07.08.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
	let game = EmojiMemoryGame()
	
    var body: some Scene {
        WindowGroup {
			ContentView(viewModel: game)
        }
    }
}

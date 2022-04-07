//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Adem Deliaslan on 1.04.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)        }
    }
}

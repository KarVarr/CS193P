//
//  MemorizeAppApp.swift
//  MemorizeApp
//
//  Created by Karen Vardanian on 06.02.2023.
//

import SwiftUI

@main
struct MemorizeAppApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}

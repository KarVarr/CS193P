//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Karen Vardanian on 06.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojiCount = 24
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive( minimum: 70))]) {
                    ForEach(EmojiMemoryGame.emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            
            .foregroundColor(.pink)
            
        }
        .padding(.horizontal)
        .background(.teal)
        
    }
}
//MARK: - Card
struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}

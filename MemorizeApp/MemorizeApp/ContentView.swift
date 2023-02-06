//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Karen Vardanian on 06.02.2023.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗", "✈️", "🚔", "🚃","🛰️", "🚀", "🗼", "🚈","🚤", "🚟", "🗿", "🚘","🚚", "🚲", "🏟️", "💺","🚨", "🚄", "🛳️", "🏎️","🚇", "🚆", "🚁", "🛸",]
    @State var emojiCount = 24
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive( minimum: 70))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            
            .foregroundColor(.pink)
            Spacer()
            HStack {
                remove
                Spacer()
                Text("random").foregroundColor(.white)
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .background(.teal)
        
    }
    //MARK: - buttons
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
            
        }
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
                
            }
        } label: {
            Image(systemName: "minus.circle")
            
        }
        
        
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

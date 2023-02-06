//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Karen Vardanian on 06.02.2023.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚗", "✈️", "🚔", "🚃","🛰️", "🚀", "🗼", "🚈","🚤", "✈️", "🗿", "🚘","🚚", "🚲", "🏟️", "💺","🚨", "🚄", "🛳️", "🏎️","🚇", "🚆", "🚁", "🛸",]
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            HStack {
                Button(action: {
                    emojiCount += 1
                }, label: {
                    HStack {
                        Text("Add Card")
                        
                    }
                })
                Button(action: {
                    emojiCount -= 1
                }, label: {
                    HStack {
                        Text("Remove Card")
                        
                    }
                })
            }
        }
        .foregroundColor(.cyan)
        .padding(.horizontal)
        .background(.gray)
       
    }
   
    
}


struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
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

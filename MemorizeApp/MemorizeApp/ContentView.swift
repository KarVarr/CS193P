//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Karen Vardanian on 06.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()

        }
        .foregroundColor(.cyan)
        .padding(.horizontal)
        .background(.gray)
    }
        
}


struct CardView: View {
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text("✈️").font(.largeTitle)
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

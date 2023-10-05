//
//  ContentView.swift
//  StarWarsStyleText
//
//  Created by Karen Vardanian on 05.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animationStart = false
    private let startAnimationDuration = 11.0

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill()
                    .foregroundStyle(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .frame(height: 250)
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.black)
            }
            .padding()
            
            Text("Tracking 3 along a narrow path, the shadow of a new moon will race across North, Central, and South America, on October 14. When viewed from the shadow path the apparent size of the lunar disk will not quite completely cover the Sun though. Instead, the moon in silhouette will appear during the minutes of totality surrounded by a fiery ring, an annular solar eclipse more dramatically known as a ring of fire eclipse. This striking time lapse sequence from May of 2012 illustrates the stages of a ring of fire eclipse. From before eclipse start until sunset, they are seen over the iconic buttes of planet Earth's Monument Valley. Remarkably, the October 14 ring of fire eclipse will also be visible over Monument Valley, beginning after sunrise in the eastern sky.")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.orange)
                .multilineTextAlignment (.center)
                .lineSpacing (10)
                .padding()
                .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                .shadow(color: .gray, radius: 2, x: 0, y: 15)
                .frame(width: 300, height: animationStart ? 750 : 0)
                .border(.red)
                .animation(Animation.linear (duration: startAnimationDuration))
                .onAppear() {
                    self.animationStart.toggle()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


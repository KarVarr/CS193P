//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Karen Vardanian on 06.02.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "camera")
                .imageScale(.large)
                .foregroundColor(.teal)
                .padding(.top, 40)
                
            Text("Hello, world!")
                .frame(width: 250,height: 50, alignment: .leading)
                .padding([.leading])
                .border(.teal)
                
                .padding(.all, 20)
        }
        .border(.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

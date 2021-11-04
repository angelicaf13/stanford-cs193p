//
//  ContentView.swift
//  Memorize
//
//  Created by Angelica Figueroa Muniz on 11/1/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🌪", "🌴", "🍁", "🌎", "🌻", "🌵", "💫", "🌧", "⚡️", "🌈", "🌊", "🔥", "✨", "🌚", "🌝"]
    @State var emojiCount = 15
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.gray)
            Spacer()
            HStack {
                natureButton
                animalsButton
                vehiculesButton
            }
            
        }
        .padding(.horizontal)
    }
    
    var natureButton: some View {
        Button {
            emojis = ["🌪", "🌴", "🍁", "🌎", "🌻", "🌵", "💫", "🌧", "⚡️", "🌈", "🌊", "🔥", "✨", "🌚", "🌝"]
            emojis.shuffle()
            emojiCount = Int.random(in: 4..<emojis.count)
        } label: {
            VStack {
                Image(systemName: "sun.max.fill")
                    .font(.largeTitle)
                Text("Nature")
            }
        }
    }
    
    var animalsButton: some View {
        Button {
            emojis = ["🦁", "🐯", "🐨", "🐻‍❄️", "🐼", "🐶", "🐱", "🐭", "🐷", "🐮", "🐥", "🦉", "🐊", "🐸", "🦩", "🐴", "🦅", "🐺", "🐔", "🐧", "🐵", "🦊"]
            emojis.shuffle()
            emojiCount = Int.random(in: 4..<emojis.count)
        } label: {
            VStack {
                Image(systemName: "tortoise.fill")
                    .font(.largeTitle)
                Text("Animals")
            }
        }
        .padding()
    }
    
    var vehiculesButton: some View {
        Button {
            emojis = ["✈️", "🚁", "🚀", "🛵", "🚗", "🛳", "🚖", "⛵️", "🚂", "🛺", "🛸", "🚜", "🚛", "🚠", "🛻"]
            emojis.shuffle()
            emojiCount = Int.random(in: 4..<emojis.count)
        } label: {
            VStack {
                Image(systemName: "car.fill")
                    .font(.largeTitle)
                Text("Vehicules")
            }
        }
    }
    

}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}

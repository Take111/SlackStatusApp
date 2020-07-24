//
//  ContentView.swift
//  SlackStatusApp
//
//  Created by 竹ノ内愛斗 on 2020/07/23.
//

import SwiftUI

struct ContentCell: View {
    @State var emoji: EmojiContent

    var body: some View {
        VStack {
            NukeImageView(nukeImage: NukeImage(url: URL(string: emoji.image)!))
            Text(emoji.title)
        }
    }
}

struct UserContent: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var name: String
}

let emojiesSample = [EmojiContent(title: "サンプル", image: "photo")]


struct ContentCell_Previews: PreviewProvider {
    static var previews: some View {
        ContentCell(emoji: emojiesSample[0])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

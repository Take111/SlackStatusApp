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
        NavigationLink(destination: EmojiDetail(emoji: emoji)) {
            VStack {
                NukeImageView(nukeImage: NukeImage(url: URL(string: emoji.image)!))
                    .frame(width: 24, height: 24)
                    .background(Color.white)
                Text(emoji.title)
                    .font(.callout)
                    .fontWeight(.thin)
                    .foregroundColor(Color.black)
            }
            .frame(width: 124, height: 124)
            .background(Color.clear)
        }
    }
}

let emojiesSample = [EmojiContent(title: "サンプル", image: "photo")]


struct ContentCell_Previews: PreviewProvider {
    static var previews: some View {
        ContentCell(emoji: emojiesSample[0])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

//
//  EmojiDetail.swift
//  SlackStatusApp
//
//  Created by 竹ノ内愛斗 on 2020/07/25.
//

import SwiftUI

struct EmojiDetail: View {
    var emoji: EmojiContent

    var body: some View {
        VStack {
            NukeImageView(nukeImage: NukeImage(url: URL(string: emoji.image)!))
                .frame(width: 120, height: 120)
            Text(emoji.title)
                .font(.callout)
                .fontWeight(.bold)
        }
    }
}

struct EmojiDetail_Previews: PreviewProvider {
    static var previews: some View {
        EmojiDetail(emoji: emojiesSample[0])
    }
}

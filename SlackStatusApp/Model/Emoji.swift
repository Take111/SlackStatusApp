//
//  Emoji.swift
//  SlackStatusApp
//
//  Created by 竹ノ内愛斗 on 2020/07/24.
//

import Foundation

struct EmojiContent: Identifiable, Hashable {

    var id = UUID()
    var title: String
    var image: String
}

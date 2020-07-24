//
//  SlackStatus.swift
//  SlackStatusApp
//
//  Created by 竹ノ内愛斗 on 2020/07/24.
//

import Foundation

struct SlackStatus: Codable, Identifiable {

    var id = UUID()
    var text: String
    var emoji: String

    enum CodingKeys: String, CodingKey {
        case text = "status_text"
        case emoji = "status_emoji"
    }
}

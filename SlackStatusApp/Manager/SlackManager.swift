//
//  SlackManager.swift
//  SlackStatusApp
//
//  Created by 竹ノ内愛斗 on 2020/07/23.
//

import Foundation
import UIKit

class SlackManager: ObservableObject {

    static private let token = "Bearer Own Token"
    static private let emojiUrl = "https://slack.com/api/emoji.list"

    @Published var emojies = [EmojiContent]()


    init(type: FetchContent) {
        switch type {
        case.emoji:
            fetchEmoji()
        case .status:
            print("")
        }
    }

    enum FetchContent {
        case emoji
        case status
    }

    func fetchEmoji() {
        let components = URLComponents(string: Self.emojiUrl)
        if let url = components?.url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue(Self.token, forHTTPHeaderField: "Authorization")

            URLSession.shared.dataTask(with: request) {[weak self] data, _, error in
                guard let self = self else { return }
                if let error = error {
                    print("fetchEmoji: error: \(error.localizedDescription)")
                }
                else if let data = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            if let emojies = json["emoji"] as? [String: String] {
                                var item = [EmojiContent]()
                                emojies.forEach { emoji in
                                    item.append(EmojiContent(title: emoji.key, image: emoji.value))
                                    print("SlackManager: emoji.value: \(emoji.value)")
                                }
                                DispatchQueue.main.async {
                                    self.emojies = item
                                }
                            }
                            else {
                                print("fetchEmoji: emojies cast failure")
                            }
                        }
                    } catch let error as NSError {
                        print("fetchEmoji: jsonObject failure error: \(error.localizedDescription)")
                    }
                }
            }.resume()
        }
    }
}

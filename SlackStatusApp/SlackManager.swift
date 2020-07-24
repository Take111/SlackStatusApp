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

    @Published var emojies = [EmojiContent]()


    init() {
        fetchEmoji()
    }

    #warning("ここはPresenterで行う")
    enum FetchContent {
        case emoji
        case status

        var url: String {
            switch self {
            case .emoji:
                return "https://slack.com/api/emoji.list"
            case .status:
                return ""
            }
        }
    }

    #warning("ここはPresenterで行う")
    func fetchEmoji() {
        let components = URLComponents(string: "https://slack.com/api/emoji.list")
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
                                print("fetchEmoji: cast failure")
                            }
                        }
                    } catch let error as NSError {
                        print("fetchEmoji: error: \(error.localizedDescription)")
                    }
                }
            }.resume()
        }
    }

    #warning("後で使う")
//    func fetchSlackContent<T: Codable>(content: FetchContent, model: T.Type, handler: @escaping (Result<T, Error>) -> Void) {
//        var components = URLComponents(string: content.url)
////        components.httpMethod = "GET"
////
////        URLSession.shared.dataTask(with: url) {[weak self] data, responce, error in
////            guard let self = self else { return }
////
////        }
//    }
}

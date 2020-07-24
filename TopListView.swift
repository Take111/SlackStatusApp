//
//  ListView.swift
//  SlackStatusApp
//
//  Created by 竹ノ内愛斗 on 2020/07/23.
//

import SwiftUI

struct TopListView: View {

    let layout = [GridItem(.fixed(126), alignment: .leading),
                  GridItem(.fixed(126), alignment: .leading)]

    @ObservedObject var emojiManager = SlackManager(type: .emoji)

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 12){
                    ForEach(emojiManager.emojies, id: \.self) { emoji in
                        ContentCell(emoji: emoji)
                    }
                    .border(Color.black)
                }
            }
            .navigationTitle("絵文字一覧")
        }
    }
}


struct TopListView_Previews: PreviewProvider {
    static var previews: some View {
        TopListView()
    }
}

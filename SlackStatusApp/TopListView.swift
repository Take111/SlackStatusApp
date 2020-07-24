//
//  ListView.swift
//  SlackStatusApp
//
//  Created by 竹ノ内愛斗 on 2020/07/23.
//

import SwiftUI

struct TopListView: View {

    let layout = [GridItem(.flexible()),
                  GridItem(.flexible())]

    @ObservedObject var emojiManager = SlackManager()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout, spacing: 0){
                    ForEach(emojiManager.emojies, id: \.self) { emoji in
                        ContentCell(emoji: emoji)
                    }
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

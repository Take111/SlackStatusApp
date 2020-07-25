//
//  SlackStatusView.swift
//  SlackStatusApp
//
//  Created by 竹ノ内愛斗 on 2020/07/25.
//

import SwiftUI

struct SlackStatusView: View {

    @ObservedObject private var manager = SlackManager(type: .readStatus)

    let layout: [GridItem] = [GridItem(.flexible(minimum: 60, maximum: 120))]

    var body: some View {
        LazyVGrid(columns: layout) {
            Text("こんにちは")
        }
    }
}

struct SlackStatusView_Previews: PreviewProvider {
    static var previews: some View {
        SlackStatusView()
    }
}

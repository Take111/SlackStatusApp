//
//  NukeImageView.swift
//  SlackStatusApp
//
//  Created by 竹ノ内愛斗 on 2020/07/24.
//

import SwiftUI

struct NukeImageView: View {
    @ObservedObject var nukeImage: NukeImage

    var body: some View {
        Image(uiImage: nukeImage.image)
            .resizable()
    }
}

struct NukeImageView_Previews: PreviewProvider {
    static var previews: some View {
        return NukeImageView(nukeImage: NukeImage(url: URL(string: "https://emoji.slack-edge.com/TS64ZDF62/dusty_stick/6177a62312.png")!))
    }
}

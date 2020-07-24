//
//  File.swift
//  SlackStatusApp
//
//  Created by 竹ノ内愛斗 on 2020/07/24.
//

import Foundation
import SwiftUI
import Nuke

class NukeImage: ObservableObject {

    @Published var image: UIImage

    private var url: URL

    init(url: URL, placeholder: UIImage = UIImage()) {
        self.url = url
        self.image = placeholder

        loadImage(url: url)
    }

    func loadImage(url: URL) {
        ImagePipeline.shared.loadImage(with: url) {[weak self] result in
            switch result {
            case .success(let responce):
                print("NukeImage: success")
                self?.image = responce.image
            case .failure(let error):
                print("NukeImage: failure: \(error.debugDescription)")
                if let image = UIImage(systemName: "photo") {
                    self?.image = image
                }
            }
        }
    }
}

struct NukeImage_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

//
//  ContentView.swift
//  SlackStatusApp
//
//  Created by 竹ノ内愛斗 on 2020/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var userContents = [UserContent]()

    var body: some View {
        NavigationView {
            List(userContents, id: \.self) { content in
                Image(systemName: content.image)
                VStack(){
                    Spacer(minLength: 8)
                    Text(content.name)
                    Spacer(minLength: 8)
                }
            }
            .navigationTitle("ステータス")
        }
    }
}

struct UserContent: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var name: String
}

let testData: [UserContent] = [
    UserContent(image: "photo", name: "昼食"),
    UserContent(image: "photo", name: "夜食")
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userContents: testData)
    }
}

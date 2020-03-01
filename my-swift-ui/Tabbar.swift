//
//  Tabbar.swift
//  my-swift-ui
//
//  Created by Amza Andrei on 3/1/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            ContentView().tabItem({
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            })
        }.edgesIgnoringSafeArea(.top)
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Tabbar().previewDevice("iPhone 7")
            Tabbar().previewDevice("iPhone 11 Pro Max")
        }
    }
}

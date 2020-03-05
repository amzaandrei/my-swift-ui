//
//  PostsList.swift
//  my-swift-ui
//
//  Created by Amza Andrei on 3/4/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import SwiftUI

struct PostsList: View {
    
//    @State var posts = [Post]()
    @ObservedObject var store = DataStore()
    
    var body: some View {
        List(store.posts) { post in
            VStack(alignment: .leading, spacing: 8) {
                Text(post.title)
                    .font(.system(.title, design: .serif)).bold()
                Text(post.body)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
//        .onAppear{
//            Api().getPost { (posts) in
//                self.posts = posts
//            }
//        }
    }
}

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}

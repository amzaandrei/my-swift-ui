//
//  DataCombine.swift
//  my-swift-ui
//
//  Created by Amza Andrei on 3/4/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    
    @Published var posts: [Post] = []
    
    init() {
        getPosts()
    }
    
    func getPosts(){
        Api().getPost { (posts) in
            self.posts = posts
        }
    }
}


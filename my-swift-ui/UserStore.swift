//
//  UserStore.swift
//  my-swift-ui
//
//  Created by Amza Andrei on 4/4/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    
    @Published var isLogged: Bool = UserDefaults.standard.bool(forKey: "isLogged"){
        didSet{
            UserDefaults.standard.setValue(self.isLogged, forKey: "isLogged")
        }
    }
    @Published var showLogin = false
    
}

//
//  UpdateStore.swift
//  my-swift-ui
//
//  Created by Amza Andrei on 3/1/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

//
//  LoadingView.swift
//  my-swift-ui
//
//  Created by Amza Andrei on 4/3/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "loading")
                .frame(width: 200, height: 200)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

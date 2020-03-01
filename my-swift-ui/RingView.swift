//
//  RingView.swift
//  my-swift-ui
//
//  Created by Amza Andrei on 3/1/20.
//  Copyright © 2020 Andrew. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5))
                .frame(width: 44, height: 44)
            Circle()
                /// 0.2 este 80%, 0.3 este 90%
                .trim(from: 0.2, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)),Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    ,style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: 44, height: 44)
                .shadow(color: Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)).opacity(0.1), radius: 3, x: 0, y: 3)
            Text("82%")
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}

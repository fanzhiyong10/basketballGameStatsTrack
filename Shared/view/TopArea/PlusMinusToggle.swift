//
//  PlusMinusToggle.swift
//  basketballGameStatsTrack (iOS)
//
//  Created by 范志勇 on 2022/11/13.
//

import SwiftUI

struct PlusMinusToggle: View {
    @State var isEnhanced = true

    var body: some View {
        HStack(spacing: 0) {
            Toggle(isOn: $isEnhanced) {
                Text("-")
                    .font(.largeTitle)
            }
                .toggleStyle(.switch)
            
            Spacer()
            
            Text("+")
                .font(.largeTitle)
        }
        .frame(width: 100, height: 50)
    }
}

struct PlusMinusToggle_Previews: PreviewProvider {
    static var previews: some View {
        PlusMinusToggle()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

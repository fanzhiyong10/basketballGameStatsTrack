//
//  PlusMinusToggle.swift
//  basketballGameStatsTrack (iOS)
//
//  Created by 范志勇 on 2022/11/13.
//

import SwiftUI

struct PlusMinusToggle: View {
    //MARK: - 全局环境变量 PlusMinus
    @EnvironmentObject var plusMinus: PlusMinus

    var body: some View {
        HStack(spacing: 0) {
            Toggle(isOn: $plusMinus.isOn) {
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
            .environmentObject(PlusMinus())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


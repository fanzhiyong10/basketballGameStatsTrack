//
//  TopAreaView.swift
//  basketballGameStatsTrack (iOS)
//
//  Created by 范志勇 on 2022/11/12.
//

import SwiftUI

struct TopAreaView: View {
    //MARK: - 绑定
    @Binding var plus_minus: Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "mic.circle.fill")
                .resizable()
                .padding(.leading, 12)
                .padding(.top, 55)
                .frame(width: 72, height: 115, alignment: .center)
                .foregroundColor(.gray)
                .onTapGesture {
                    print("mic.circle.fill")
                }
            
            VStack(alignment: .center, spacing: 20) {
                Text("\"Ben Make\"")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding(.top, 12)
                
//                PlusMinusButtonGroup(plus_minus: $plus_minus)
                PlusMinusToggle()
            }
            
            Spacer()
            
            GameClockView()
                .padding(.top, 8)
//                .padding(.leading, 20)

            Spacer()
            
            TeamPeriodScoreTable()
                .frame(width: 500, height: 120, alignment: .topLeading)
//                .padding(.leading, 20)
//                .ignoresSafeArea()
            
            OpponentScoreStepper()
                .padding(.top, 8)
        }
        
//        .ignoresSafeArea()
    }
    
    private func toPlus() {
        print("plus_minus = 1")
        self.plus_minus = 1
    }
}

struct TopAreaView_Previews: PreviewProvider {
    static var previews: some View {
        TopAreaView(plus_minus: .constant(1))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

//
//  TopAreaView.swift
//  basketballGameStatsTrack (iOS)
//
//  Created by 范志勇 on 2022/11/12.
//

import SwiftUI

///全局变量
class MainStateControl: ObservableObject {
    // PlusMinus，缺省为+1，true
    @Published var isOnPlusMinus = true
    
    var value: Int {
        if isOnPlusMinus {
            print("isOn == true")
            return 1
        } else {
            print("isOn == false")
            return -1
        }
    }
    
    // 声控，缺省为false
    @Published var isOnVoiceControl = false
    
    // 大表显示，缺省为false，不显示
    @Published var isOnZoomin = false
    
    // 手动输入显示，缺省为false，不显示
    @Published var isOnManualCommand = false
}

struct TopAreaView: View {
    
    //MARK: - 全局环境变量 状态控制
    @EnvironmentObject var mainStates: MainStateControl

    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(systemName: "mic.circle.fill")
                .resizable()
                .padding(.leading, 12)
                .padding(.top, 55)
                .frame(width: 72, height: 115, alignment: .center)
                .foregroundColor(self.mainStates.isOnVoiceControl ? .green : .gray)
                .onTapGesture {
                    print("mic.circle.fill")
                    self.mainStates.isOnVoiceControl.toggle()
                }
            
            VStack(alignment: .leading, spacing: 6) {
                Text("\"Ben Make\"")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding(.leading, -60)
                
                PlusMinusToggle()
                    .padding(.leading, 20)
                
                Text("Manual Command")
                    .font(.title3)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        print("Manual Command")
                    }
            }
            
            Spacer()
            
            GameClockView()
                .padding(.top, 8)

            Spacer()
            
            TeamPeriodScoreTable()
                .frame(width: 500, height: 120, alignment: .topLeading)
            
            OpponentScoreStepper()
                .padding(.top, 8)
                .padding(.trailing, 20)
        }
    }
    
    private func toPlus() {
        print("plus_minus = 1")
//        self.plus_minus = 1
    }
}

struct TopAreaView_Previews: PreviewProvider {
    static var previews: some View {
        TopAreaView()
            .environmentObject(MainStateControl())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

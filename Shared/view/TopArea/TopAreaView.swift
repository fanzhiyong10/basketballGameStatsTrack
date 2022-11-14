//
//  TopAreaView.swift
//  basketballGameStatsTrack (iOS)
//
//  Created by 范志勇 on 2022/11/12.
//

import SwiftUI

///全局变量
class PlusMinus: ObservableObject {
    // PlusMinus，缺省为+1，true
    @Published var isOn = true
    
    var value: Int {
        if isOn {
            print("isOn == true")
            return 1
        } else {
            print("isOn == false")
            return -1
        }
    }
    
    // 声控，缺省为false
    @Published var isOnVoiceControl = false
}

struct TopAreaView: View {
    
    //MARK: - 全局环境变量 PlusMinus
    @EnvironmentObject var plusMinus: PlusMinus

    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(systemName: "mic.circle.fill")
                .resizable()
                .padding(.leading, 12)
                .padding(.top, 55)
                .frame(width: 72, height: 115, alignment: .center)
                .foregroundColor(self.plusMinus.isOnVoiceControl ? .green : .gray)
                .onTapGesture {
                    print("mic.circle.fill")
                    self.plusMinus.isOnVoiceControl.toggle()
                }
            
            VStack(alignment: .leading, spacing: 6) {
                PlusMinusToggle()
                
                Text("\"Ben Make\"")
                    .font(.title)
                    .foregroundColor(.green)
                
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
            .environmentObject(PlusMinus())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

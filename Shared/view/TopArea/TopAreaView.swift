//
//  TopAreaView.swift
//  basketballGameStatsTrack (iOS)
//
//  Created by 范志勇 on 2022/11/12.
//

import SwiftUI

///全局变量
class PlusMinus: ObservableObject {
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
}

struct TopAreaView: View {
    
    //MARK: - 状态
    @State private var isOnVoiceControl = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "mic.circle.fill")
                .resizable()
                .padding(.leading, 12)
                .padding(.top, 55)
                .frame(width: 72, height: 115, alignment: .center)
                .foregroundColor(self.isOnVoiceControl ? .green : .gray)
                .onTapGesture {
                    print("mic.circle.fill")
                    self.isOnVoiceControl.toggle()
                }
            
            VStack(alignment: .center, spacing: 20) {
                Text("\"Ben Make\"")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding(.top, 12)
                
                PlusMinusToggle()
            }
            
            Spacer()
            
            GameClockView()
                .padding(.top, 8)

            Spacer()
            
            TeamPeriodScoreTable()
                .frame(width: 500, height: 120, alignment: .topLeading)
            
            OpponentScoreStepper()
                .padding(.top, 8)
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
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

//
//  GameClockView.swift
//  basketballGameStatsTrack (iOS)
//
//  Created by 范志勇 on 2022/11/13.
//

import SwiftUI

struct GameClockView: View {
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .center, spacing: 10) {
                Text("Game Clock  00 : 00 : 00")
                    .font(.system(size: 32))
                    .foregroundColor(.green)
                
                HStack(alignment: .center) {
                    Button(action: {
                        print("Start")
                    }) {
                        Text("START")
                            .frame(width: 50, height: 50, alignment: .center)
                            .font(.system(size: 12))
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print("Stop")
                    }) {
                        Text("STOP")
                            .frame(width: 50, height: 50, alignment: .center)
                            .font(.system(size: 12))
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    
                    
                }
                .frame(width: 300.0)
                
            }
            
            Image(systemName: "plus.magnifyingglass")
                .font(.system(size: 60))
                .padding(.top, 50.0)
                .onTapGesture {
                    print("plus.magnifyingglass")
                }
        }
        
    }
}

struct GameClockView_Previews: PreviewProvider {
    static var previews: some View {
        GameClockView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

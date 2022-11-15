//
//  MainTracker.swift
//  basketballGameStatsTrack (iOS)
//
//  Created by 范志勇 on 2022/11/11.
//

import SwiftUI

///主页面
///
///技巧
/// - 隐藏导航栏区域，该区域的对象会响应设定的事件
struct MainTracker: View {
    
    //MARK: - 全局环境变量 PlusMinus
    @EnvironmentObject var plusMinus: PlusMinus

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TopAreaView()
                .frame(height: 130, alignment: .topLeading)
                .background(Color.init(.sRGB, red: 0.9, green: 0.9, blue: 0.9, opacity: 1.0))
            
            PlayerLiveDataTable()
                .ignoresSafeArea()
                .overlay(alignment: .topLeading) {
                    if self.plusMinus.isOnZoomin {
                        // 场上队员表：放大显示
                        VStack(spacing: 0) {
                            OnCourtPlayerLiveDataTable()

                            // 白色填充，不让背后的表露出了
                            Color.white
                                .frame(height: 100)
                        }
                        
                    }
                }
        }
        .ignoresSafeArea() // 忽略
        .navigationBarHidden(true) // 隐藏导航栏区域，该区域的对象会响应设定的事件
    }
}

struct MainTracker_Previews: PreviewProvider {
    static var previews: some View {
        MainTracker()
            .environmentObject(PlusMinus())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

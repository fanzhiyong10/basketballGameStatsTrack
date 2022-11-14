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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TopAreaView()
                .frame(height: 130, alignment: .topLeading)
                .background(Color.init(.sRGB, red: 0.9, green: 0.9, blue: 0.9, opacity: 1.0))
            
            PlayerLiveDataTable()
                .ignoresSafeArea()
        }
        .ignoresSafeArea() // 忽略
        .navigationBarHidden(true) // 隐藏导航栏区域，该区域的对象会响应设定的事件
    }
}

struct MainTracker_Previews: PreviewProvider {
    static var previews: some View {
        MainTracker()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

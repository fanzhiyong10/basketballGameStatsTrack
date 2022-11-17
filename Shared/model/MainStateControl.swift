//
//  MainStateControl.swift
//  basketballGameStatsTrack (iOS)
//
//  Created by 范志勇 on 2022/11/15.
//

import Foundation

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
    
    // 按钮：声控，缺省为false
    @Published var isOnVoiceControl = false
    
    // 按钮：大表显示，缺省为false，不显示
    @Published var isOnZoomin = false
    
    // 按钮：上场队员替换显示，缺省为false，不显示
    @Published var isOnPlayers = false
    
    // 按钮：手动输入显示，缺省为false，不显示
    @Published var isOnManualCommand = false
    
    
    //MARK: - 比赛进行了多长时间，计数器
    @Published var game_cum_duration: Float = 23 * 60 + 45
}

